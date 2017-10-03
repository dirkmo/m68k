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

    enum Commands {
        i2c_start = 0x02,
        i2c_stop = 0x03,
        i2c_read = 0x04,
        i2c_ack = 0x06,
        i2c_nack = 0x07,
        i2c_bulk = 0x10,
        
        spi_cs_low = 0x02,
        spi_cs_high = 0x03,
        spi_rxtx = 0x10,
        spi_cfg = 0x8A, // 3,3V, CLK idle low, CLK edge active to idle, sample in middle
        spi_pwron = 0x49, // enable 3,3V power supply, pullups=0, aux=0, cs=1
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

    /// Switch BP to binary mode
    bool switchToModeBinary() {
        //writeln(__FUNCTION__);
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
            // send 10 times CR
            data.length = 10;
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
    bool command( char cmd, bool bDebug = false ) {
        //writeln(__FUNCTION__);
        m_ser.flush();
        m_ser.modeBlockWithTimeout(5);
        m_ser.write( [ cmd ], bDebug );
        char[] cAnswer;
        const int count = m_ser.read( cAnswer, 1, bDebug );
        if( count < 1 || cAnswer[0] != 1 ) {
            return false;
        }
        return true;
    }

    /// Switch BP to terminal mode
    bool switchToModeTerminal() {
        //writeln(__FUNCTION__);
        m_ser.modeBlockWithTimeout(5);
        m_ser.flush();
        char[] cAnswer;
        cAnswer.length = 0;
        m_ser.write( [ 0 ] );
        if( m_ser.read( cAnswer, 0 ) < 5 || indexOf(to!string(cAnswer), "BBIO1", 0) == -1 ) {
            return false;
        }
        if( command( 0x0F ) ) {
            m_mode = Mode.terminal;
            return true;
        }
        m_mode = Mode.unknown;
        return false;
    }
    
    bool switchToModeSpi() {
        //writeln(__FUNCTION__);
        return switchToMode( Mode.spi );
    }

    bool switchToModeI2C() {
        //writeln(__FUNCTION__);
        return switchToMode( Mode.i2c );
    }

    bool send_i2c( ubyte i2cAddr, char[] data ) {
        if( m_mode != Mode.i2c && !switchToModeI2C() ) {
            return false;
        }
        const numBytes = data.length;
        if( numBytes > 16 ) {
            return false;
        }
        command( Commands.i2c_start, true );
        char cmd = cast(char)(Commands.i2c_bulk | numBytes);
        command( cmd, true );
        char[] dts = [ cast(char)i2cAddr ] ~ data;
        m_ser.write( dts, true );
        char[] recData;
        m_ser.read( recData, cast(int)numBytes+1, true );
        command( Commands.i2c_stop, true );
        return true;
    }
    
    protected:
    
    /// switch BP to SPI or I2C mode
    bool switchToMode(Mode mode) {
        //writeln(__FUNCTION__);
        string sMode;
        char val;
        switch(mode) {
            case Mode.spi: val = 1; sMode = "SPI1"; break;
            case Mode.i2c: val = 2; sMode = "I2C1"; break;
            default: return false;
        }
        if( m_mode != mode ) {
            if( m_mode != Mode.binary ) {
                if( ! switchToModeBinary() ) {
                    return false;
                }
            }
            m_ser.flush();
            m_ser.modeBlockWithTimeout(5);
            m_ser.write( [ val ] );
            string answer;
            char[] charAnswer;
            if( m_ser.read( charAnswer, 4 ) == 4 ) {
                answer = to!string(charAnswer);
                if( indexOf(answer, sMode, 0) > -1 ) {
                    m_mode = mode;
                    return true;
                }
            }
            return false;
        }
        // already in mode
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

    bp.send_i2c( 0x42, [ 0x09, 0xF0 ] );

    if( ! bp.switchToModeTerminal() ) {
        writefln("Cannot switch to terminal mode");
        return 4;
    }

    return 0;
}
