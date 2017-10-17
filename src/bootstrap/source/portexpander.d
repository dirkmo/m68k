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

    this( SerialPort* p_pSerial, ubyte p_i2cAddr ) {
        m_pSerial = p_pSerial;
        m_i2cAddr = p_i2cAddr;
        m_pSerial.modeBlockWithInterCharTimeout(1,5);
    }

    bool probeBusPirate() {
        if( m_bpIsOkay ) {
            return true;
        }
        m_bpIsOkay = false;
        m_pSerial.write( "\n\n\n".dup() );

        Thread.sleep( dur!("msecs")(200) );
        m_pSerial.flush();
        m_pSerial.write( "i\n".dup() );
        Thread.sleep( dur!("msecs")(200) );
        char[] line;
        m_pSerial.read(line, 0);
        if( indexOf(line,"Bus Pirate") == -1 ) {
            return false;
        }
        m_bpIsOkay = true;
        m_pSerial.write( "m 4 4\nW\n".dup() );
        Thread.sleep( dur!("msecs")(200) );
        m_pSerial.read(line, 0); // wait and read whats available
        return m_bpIsOkay;
    }

    bool discover() {
        if( !probeBusPirate() ) {
            return false;
        }
        const ubyte i2caddr = cast(ubyte)(m_i2cAddr << 1);
        m_pSerial.flush();
        m_pSerial.write( std.string.format("[0x%02X]\n", m_i2cAddr << 1).dup() );
        char [] line;
        m_pSerial.read(line, 0);
        if( indexOf( line, std.string.format("WRITE: 0x%02X ACK", i2caddr)) > -1 ) {
            return true;
        }
        return false;
    }

    bool setRegister( Register reg, ubyte value ) {
        if( !probeBusPirate() ) {
            return false;
        }
        string sLine = std.string.format("[0x%02X 0x%02X 0x%02X]\n", m_i2cAddr<<1, reg, value);
        m_pSerial.write(sLine.dup());
        char [] line;
        m_pSerial.read(line, 0);
        return true;
    }

    bool getRegister( Register reg, ref ubyte value ) {
       if( !probeBusPirate() ) {
            return false;
        }
        const ubyte ia = cast(ubyte)(m_i2cAddr << 1);
        m_pSerial.flush();
        m_pSerial.write( std.string.format("[0x%02X 0x%02X[0x%02X r]\n", ia, reg, ia|1).dup() );
        char [] line;
        m_pSerial.read(line, 0);
        auto p = line.indexOf("READ: ");
        if( p > -1 ) {
            p += 8;
        }
        value = to!ubyte(line[p..p+2], 16);
        return false;
    }

    bool setDirPort( Port port, ubyte value ) {
        const Register reg = cast(Register)(Register.iodir | port);
        if(port == Port.low) {
            dirLow = value;
        } else {
            dirHigh = value;
        }
        return setRegister(reg, value);
    }

    bool setDirBit( Port port, ubyte bitIndex, bool bitValue ) {
        if( bitIndex > 7 ) {
            return false;
        }
        const Register reg = cast(Register)(Register.iodir | port);
        if(port == Port.low) {
            dirLow  = cast(ubyte)( (dirLow  & (1 << bitIndex)) | (bitValue << bitIndex) );
        } else {
            dirHigh = cast(ubyte)( (dirHigh & (1 << bitIndex)) | (bitValue << bitIndex) );
        }
        return setRegister(reg, port == Port.low ? dirLow : dirHigh);
    }

    bool setLatchPort( Port port, ubyte value ) {
        const Register reg = cast(Register)(Register.olat | port);
        if(port == Port.low) {
            latchLow = value;
        } else {
            latchHigh = value;
        }
        return setRegister(reg, value);
    }

    bool setLatchBit( Port port, ubyte bitIndex, bool bitValue ) {
       if( bitIndex > 7 ) {
            return false;
        }
        const Register reg = cast(Register)(Register.iodir | port);
        if(port == Port.low) {
            latchLow  = cast(ubyte)( (latchLow  & (1 << bitIndex)) | (bitValue << bitIndex) );
        } else {
            latchHigh = cast(ubyte)( (latchHigh & (1 << bitIndex)) | (bitValue << bitIndex) );
        }
        return setRegister(reg, port == Port.low ? latchLow : latchHigh);
    }

    bool getGpioPort( Port port, ref ubyte value ) {
        Register reg = cast(Register)(Register.gpio | port);
        return getRegister( reg, value );
    }

    @property int i2cAddr() { return m_i2cAddr; }

    private:
        SerialPort *m_pSerial;
        ubyte m_i2cAddr;
        bool m_bpIsOkay = false;

        ubyte latchLow = 0;
        ubyte latchHigh = 0;
        ubyte dirLow = 0xFF;
        ubyte dirHigh = 0xFF;
}