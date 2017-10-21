import dserial;
import portexpander;
import std.stdio;

class DataBus : PortExpander {

    this( SerialPort serial ) {
        super(serial, 0x20);
    }

    bool init() {
        if( !discover() ) {
            return false;
        }
        highz();
        return true;
    }

    void highz() {
        iodir16 = 0xFFFF;
    }

    void output( ushort value ) {
        olat16 = value;
        if( iodir16 != 0 ) {
            iodir16 = 0;
        }
    }
}