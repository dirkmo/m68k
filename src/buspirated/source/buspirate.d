module buspirate;

import dserial;
import core.thread;
import std.conv;
import std.stdio;
import std.string;

class BusPirate {

    enum Mode {
        unknown,
        terminal,
        binary,
        spi,
        i2c
    }

    this() {
        m_ser = new dserial.SerialPort();
        m_mode = Mode.unknown;
    }

    bool connect(string port) {
        if( m_ser.open( port, 115200 ) < 0 ) {
            return false;
        }
        return true;
    }

    bool receiveAtLeast( ref char[] data, uint count ) {
        m_ser.blockWithTimeout(1);
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

    bool switchToModeBinary() {
        m_ser.blockWithTimeout(1);
        char[] data;
        data.length = 20;
        data[] = '\r';
        m_ser.write( data );

        char[] answer;
        data.length = 1;
        data[] = 0;
        m_ser.write(data);
        if( !receiveAtLeast( data, 5 ) ) return false;
        if( indexOf( to!string(answer), "BBIO1", 0 ) > -1 ) {
            m_mode = Mode.binary;
            return true;
        }
        m_mode = Mode.unknown;
        return false;
    }

    bool switchToModeTerminal() {
        m_ser.flush();
        string answer;
        char[] charAnswer;
        charAnswer.length = 0;
        while( indexOf(answer, "BBIO1", 0) == -1 ) {
            m_ser.write( [ cast(char)(0) ] );
            m_ser.read( charAnswer, 5 );
            answer ~= to!string(charAnswer);
            writeln(answer);
        }
        m_ser.write( [ cast(char)(0x0F) ] );
        char[] data;
        if( m_ser.read( data, 1) == 1 && data[0] == 1 ) {
            m_mode = Mode.terminal;
            return true;
        }
        m_mode = Mode.unknown;
        return false;
    }

    bool switchToModeSpi() {
        if( m_mode != Mode.spi ) {
            if( m_mode != Mode.binary ) {
                if( ! switchToModeBinary() ) {
                    return false;
                }
            }
            m_ser.write( [cast(char)1]);
            Thread.sleep( dur!("msecs")(50) );
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
        return true;
    }

    bool switchToModeI2C() {
        return false;
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
    if ( ! bp.switchToModeSpi() ) {
        writefln("Cannot switch to spi mode");
        //return 3;
    }

    if( ! bp.switchToModeTerminal() ) {
        writefln("Cannot switch to terminal mode");
        return 4;
    }

    return 0;
}
