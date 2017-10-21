import dserial;
import portexpander;
import std.stdio;

class Control : PortExpander {

    this( SerialPort* p_pSerial ) {
        super(p_pSerial, 0x21);
    }

    bool init() {
        if( !discover() ) {
            return false;
        }
        iodir = ~cast(ubyte)(PinMask.boot | PinMask.dtack_trig | PinMask.reshalt | PinMask.rw);
        olat = 0;
        return true;
    }

    void highz() {
        iodir = 0xFF;
    }

    @property bool reset( bool state ) {
        if( state ) {
            olat = olat & ~PinMask.reshalt;
        } else {
            olat = olat | PinMask.reshalt;
        }
        return state;
    }
    @property bool reset() {
        return (olat & PinMask.reshalt) == 0;
    }

    void dtack() {
        olat = olat | PinMask.dtack_trig;
        olat = olat & ~PinMask.dtack_trig;
    }

    @property bool boot( bool state ) {
        if(state) {
            olat = olat | PinMask.boot;
        } else {
            olat = olat & ~PinMask.boot;
        }
        return state;
    }
    @property bool boot() {
        return (olat & PinMask.boot) > 0;
    }

    @property bool rw( bool read ) {
        if(read) {
            olat = olat | PinMask.rw;
        } else {
            olat = olat & ~PinMask.rw;
        }
        return read;
    }
    @property bool rw() {
        return (olat & PinMask.rw) > 0;
    }

    enum Reset {
        cpuReset,
        cpuRunning
        
    }

    private enum PinMask {
        boot        = 1<<0,
        dtack_trig  = 1<<1,
        reset       = 1<<2,
        halt        = 1<<3,
        reshalt     = reset | halt,
        rw          = 1<<4
    }
}