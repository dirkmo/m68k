module portexpander;

import core.thread;
import dserial;
import std.conv;
import std.format;
import std.stdio;
import std.string;

class PortExpander {
    enum Register {
        iodir = 0x00,
        gpio  = 0x09,
        olat  = 0x0A
    }

    enum Port {
        low = 0,
        high = 0x10
    }

    this( SerialPort serial, ubyte p_i2cAddr ) {
        m_serial = serial;
        m_i2cAddr = p_i2cAddr;
        m_serial.modeBlockWithInterCharTimeout(1,5);
    }

    bool probeBusPirate() {
        if( m_bpIsOkay ) {
            return true;
        }
        m_bpIsOkay = false;
        m_serial.write( "\n\n\n".dup() );

        Thread.sleep( dur!("msecs")(200) );
        m_serial.flush();
        m_serial.write( "i\n".dup() );
        Thread.sleep( dur!("msecs")(200) );
        char[] line;
        m_serial.read(line, 0);
        if( indexOf(line,"Bus Pirate") == -1 ) {
            return false;
        }
        m_bpIsOkay = true;
        m_serial.write( "m 4 4\nW\n".dup() );
        Thread.sleep( dur!("msecs")(200) );
        m_serial.read(line, 0); // wait and read whats available
        return m_bpIsOkay;
    }

    bool discover() {
        if( !probeBusPirate() ) {
            return false;
        }
        const ubyte i2caddr = cast(ubyte)(m_i2cAddr << 1);
        m_serial.flush();
        m_serial.write( std.string.format("[0x%02X]\n", m_i2cAddr << 1).dup() );
        char [] line;
        m_serial.read(line, 0);
        if( indexOf( line, std.string.format("WRITE: 0x%02X ACK", i2caddr)) > -1 ) {
            return getState();
        }
        return false;
    }

    bool setRegister( Register reg, ubyte value ) {
        if( !probeBusPirate() ) {
            return false;
        }
        string sLine = std.string.format("[0x%02X 0x%02X 0x%02X]\n", m_i2cAddr<<1, reg, value);
        m_serial.write(sLine.dup());
        char [] line;
        m_serial.read(line, 0);
        return true;
    }

    bool getRegister( Register reg, ref ubyte value ) {
       if( !probeBusPirate() ) {
            return false;
        }
        const ubyte ia = cast(ubyte)(m_i2cAddr << 1);
        m_serial.flush();
        m_serial.write( std.string.format("[0x%02X 0x%02X[0x%02X r]\n", ia, reg, ia|1).dup() );
        char [] line;
        m_serial.read(line, 0);
        auto p = line.indexOf("READ: ");
        if( p > -1 ) {
            p += 8;
            value = to!ubyte(line[p..p+2], 16);
            return true;
        }
        return false;
    }

    bool getState() {
        bool ret;
        ret  = getRegister( cast(Register)(Register.olat  | Port.low ), olat_low );
        ret &= getRegister( cast(Register)(Register.olat  | Port.high), olat_high );
        ret &= getRegister( cast(Register)(Register.iodir | Port.low ), iodir_low );
        ret &= getRegister( cast(Register)(Register.iodir | Port.high), iodir_high );
        return ret;
    }

    bool setDirPort( ubyte value, Port port = Port.low ) {
        const Register reg = cast(Register)(Register.iodir | port);
        if(port == Port.low) {
            iodir_low = value;
        } else {
            iodir_high = value;
        }
        return setRegister(reg, value);
    }

    bool setDirBit( ubyte bitIndex, bool bitValue, Port port = Port.low ) {
        if( bitIndex > 7 ) {
            return false;
        }
        const Register reg = cast(Register)(Register.iodir | port);
        if(port == Port.low) {
            iodir_low  = cast(ubyte)( (iodir_low  & (1 << bitIndex)) | (bitValue << bitIndex) );
        } else {
            iodir_high = cast(ubyte)( (iodir_high & (1 << bitIndex)) | (bitValue << bitIndex) );
        }
        return setRegister(reg, port == Port.low ? iodir_low : iodir_high);
    }

    bool setLatchPort( ubyte value, Port port = Port.low ) {
        const Register reg = cast(Register)(Register.olat | port);
        if(port == Port.low) {
            olat_low = value;
        } else {
            olat_high = value;
        }
        return setRegister(reg, value);
    }

    bool setLatchBit( ubyte bitIndex, bool bitValue, Port port = Port.low ) {
       if( bitIndex > 7 ) {
            return false;
        }
        const Register reg = cast(Register)(Register.iodir | port);
        if(port == Port.low) {
            olat_low  = cast(ubyte)( (olat_low  & (1 << bitIndex)) | (bitValue << bitIndex) );
        } else {
            olat_high = cast(ubyte)( (olat_high & (1 << bitIndex)) | (bitValue << bitIndex) );
        }
        return setRegister(reg, port == Port.low ? olat_low : olat_high);
    }

    bool getGpioPort( ref ubyte value, Port port = Port.low ) {
        Register reg = cast(Register)(Register.gpio | port);
        return getRegister( reg, value );
    }
    
   @property ubyte gpio() {
        ubyte value;
        getGpioPort( value );
        return value;
    }

    @property ushort gpio16() {
        ushort val16;
        ubyte val8;
        getGpioPort( val8 );
        val16 = val8;
        getGpioPort( val8, Port.high );
        val16 |= val8 << 8;
        return val16;
    }  

    @property ubyte iodir()    { return iodir_low; }

    @property ushort iodir16() { return (iodir_high << 8) | iodir_low; }

    @property ubyte iodir(ubyte iodir) {
        iodir_low = iodir;
        setDirPort( iodir_low );
        return iodir;
    }
    @property ushort iodir16( ushort iodir16 ) {
        iodir_low = iodir16 & 0xFF;
        iodir_high = (iodir16 >> 8) & 0xFF;
        setDirPort( iodir_low );
        setDirPort( iodir_high, Port.high );
        return iodir16;
    }

    @property ubyte olat()    { return olat_low; }
    @property ushort olat16() { return (olat_high << 8) | olat_low; }

    @property ubyte olat(ubyte olat) {
        olat_low = olat;
        setLatchPort( olat_low );
        return olat;
    }
    @property ushort olat16( ushort olat16 ) {
        olat_low = olat16 & 0xFF;
        olat_high = (olat16 >> 8) & 0xFF;
        setLatchPort( olat_low );
        setLatchPort( olat_high, Port.high );
        return olat16;
    }

    @property ubyte i2cAddr() { return m_i2cAddr; }

    private:
        SerialPort m_serial;
        ubyte m_i2cAddr;
        bool m_bpIsOkay = false;

        ubyte olat_low = 0;
        ubyte olat_high = 0;
        ubyte iodir_low = 0xFF;
        ubyte iodir_high = 0xFF;
}