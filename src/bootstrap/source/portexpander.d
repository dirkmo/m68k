module portexpander;

import dserial;
import std.stdio;
import std.string;
import core.thread;
import std.conv;
import std.format;

class PortExpander {
    enum Register {
        IODIR = 0x00,
        GPIO = 0x09,
        OLAT = 0x0A
    };

    enum Port {
        LOW = 0,
        HIGH = 0x10
    };

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

    bool setDirPort( Port port, ubyte dir ) {
        return false;
    }

    bool setDirBit( Port port, ubyte bit, ubyte dir ) {
        return false;
    }

    bool setLatchPort( Port port, ubyte value ) {
        return false;
    }

    bool setLatchBit( Port port, ubyte bit, bool value ) {
        return false;
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