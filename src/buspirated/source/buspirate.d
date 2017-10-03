module buspirate;

import dserial;
import core.thread;
import std.conv;
import std.stdio;
import std.string;

/// Bus Pirate control class
class BusPirate {

    /// possible Bus Pirate modes
    enum Mode {
        unknown,
        terminal,
        binary,
        spi,
        i2c
    }

    /// constructor
    this() {
        m_ser = new dserial.SerialPort();
        m_mode = Mode.unknown;
    }

    /// connect to serial port
    bool connect(string port) {
        if( m_ser.open( port, 115200 ) < 0 ) {
            return false;
        }
        m_ser.flush();
        return true;
    }

    /// Enable timeout of 100 ms and try to receive count bytes
    bool receiveAtLeast( ref char[] data, uint count ) {
        m_ser.modeBlockWithTimeout(1);
        char[] rec;
        int rec_count = 0;
        while( rec_count < count ) {
            rec_count += m_ser.read( rec, count );
            if( rec_count == 0 ) {
                return false; // timeout
            }
            data ~= rec;
        }
        return true;
    }

    /// Switch BP to binary mode
    bool switchToModeBinary() {
        writeln(__FUNCTION__);
        m_ser.modeBlockWithTimeout(1);
        m_ser.flush();
        
        char[] data;
        data.length = 1;
        data[] = 0;
        m_ser.write( data );
        char[] cAnswer;
        m_ser.read( cAnswer, 5 );
        if ( to!string(cAnswer) == "BBIO1" ) {
            m_mode = Mode.binary;
            return true;
        }


        if( m_mode == Mode.unknown || m_mode == Mode.terminal ) {
            // send 20 times CR
            data.length = 20;
            data[] = '\r';
            m_ser.write( data );
            Thread.sleep( dur!("msecs")(100) );
            m_ser.flush();
        }

        // send 20 times 0
        data.length = 20; data[] = 0;
        m_ser.write(data);

        // now send 0 until BusPirate answers with "BBIO1"
        if( ! m_ser.modeBlockWithTimeout(5) ) {
            return false;
        }
        string sAnswer;
        data.length = 1; data[] = 0;
        for( int i = 0; i < 10; i++ ) {
            cAnswer.length = 0;
            m_ser.read( cAnswer, 5 );
            sAnswer ~= to!string(cAnswer);
            m_ser.write(data);
            if( indexOf( sAnswer, "BBIO1", 0 ) > -1 ) {
                m_mode = Mode.binary;
                return true;
            }
        }
        writeln("ERROR: ", sAnswer);
        m_mode = Mode.unknown;
        return false;
    }

    /// send command byte and expect 0x01 as answer.
    bool command( char cmd ) {
        writeln(__FUNCTION__);
        m_ser.flush();
        m_ser.modeBlockWithTimeout(5);
        m_ser.write( [ cmd ] );
        char[] cAnswer;
        int count = m_ser.read( cAnswer, 0 );
        if( count != 1 || cAnswer[0] != 1 ) {
            writeln(cAnswer);
            return false;
        }
        return true;
    }

    /// Switch BP to terminal mode
    bool switchToModeTerminal() {
        writeln(__FUNCTION__);
        m_ser.modeBlockWithTimeout(5);
        m_ser.flush();
        char[] cAnswer;
        cAnswer.length = 0;
        m_ser.write( [ 0 ] );
        if( m_ser.read( cAnswer, 0 ) < 5 || indexOf(to!string(cAnswer), "BBIO1", 0) == -1 ) {
            return false;
        }
        Thread.sleep(dur!("msecs")(1000));
        if( command( 0x0F ) ) {
            m_mode = Mode.terminal;
            return true;
        }
        m_mode = Mode.unknown;
        return false;
    }

    /// switch BP to SPI mode
    bool switchToModeSpi() {
        writeln(__FUNCTION__);
        if( m_mode != Mode.spi ) {
            if( m_mode != Mode.binary ) {
                if( ! switchToModeBinary() ) {
                    return false;
                }
            }
            m_ser.modeBlockWithTimeout(1);
            m_ser.write( [ 1 ] );
            string answer;
            char[] charAnswer;
            if( m_ser.read( charAnswer, 4 ) == 4 ) {
                answer = to!string(charAnswer);
                if( indexOf(answer, "SPI1", 0) == -1 ) {
                    m_mode = Mode.spi;
                    return true;
                }
            }
            return false;
        }
        // already in spi mode
        writeln("already in spi mode");
        return true;
    }

    /// switch BP to I2C mode
    bool switchToModeI2C() {
        writeln(__FUNCTION__);
        if( m_mode != Mode.i2c ) {
            if( m_mode != Mode.binary ) {
                if( ! switchToModeBinary() ) {
                    return false;
                }
            }
            m_ser.modeBlockWithTimeout(1);
            m_ser.write( [ 2 ] );
            string answer;
            char[] charAnswer;
            if( m_ser.read( charAnswer, 4 ) == 4 ) {
                answer = to!string(charAnswer);
                if( indexOf(answer, "I2C1", 0) == -1 ) {
                    m_mode = Mode.i2c;
                    return true;
                }
            }
            return false;
        }
        // already in i2c mode
        writeln("already in i2c mode");
        return true;
    }

    private:
        dserial.SerialPort m_ser;
        Mode m_mode;
}

int main( string[] args ) {
    if( args.length < 2 ) {
        writeln("Missing Bus Pirate serial port name");
        return 1;
    }
    BusPirate bp = new BusPirate();
    if( ! bp.connect(args[1]) ) {
        writefln("Cannot connect to BusPirate on port %s", args[1]);
        return 2;
    }

    if ( ! bp.switchToModeBinary() ) {
        writefln("Cannot switch to binary mode");
        return 3;
    }

    if ( ! bp.switchToModeSpi() ) {
        writefln("Cannot switch to spi mode");
        //return 3;
    }

    if ( ! bp.switchToModeI2C() ) {
        writefln("Cannot switch to i2c mode");
        //return 3;
    }

    if( ! bp.switchToModeTerminal() ) {
        writefln("Cannot switch to terminal mode");
        return 4;
    }

    return 0;
}
