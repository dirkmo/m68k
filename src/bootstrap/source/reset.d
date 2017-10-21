import std.stdio;
import dserial;
import portexpander;


enum Expander {
    MCP23017 = 0x20,
    MCP23008 = 0x21
}

enum Pins {
    boot = 0,
    dtack_trig = 1,
    reset = 2,
    halt = 3,
    rw = 4
}

int main(string[] args)
{
    string port;
    version(linux) { port = "/dev/serial/by-id/usb-FTDI_FT232R_USB_UART_AL03NOWB-if00-port0"; }
    version(OSX)   { port = "/dev/cu.usbserial-AL03NOWB"; }
    string param;
	if( args.length > 1 ) {
		param = args[1];
	}
    SerialPort p = new SerialPort();
	
    if( ! p.open(port, 115200) ) {
        writefln("ERROR: Failed to open port %s", port);
        return 1;
    }

    PortExpander pe8 = new PortExpander( &p, Expander.MCP23008 );

    if( !pe8.probeBusPirate() ) {
        writeln("No Bus Pirate found.");
        return 2;
    }

    if( !pe8.discover() ) {
        writefln("MCP23008 not found on address 0x%02X", pe8.i2cAddr);
        return 3;
    }

    ubyte mask = cast(ubyte)(1<<Pins.reset | 1<<Pins.halt);
    writefln("mask: %02X", mask);

    if( param == "0" || param == "" ){
        pe8.iodir = pe8.iodir & ~mask;
        pe8.olat = pe8.olat & ~mask;
        writefln("iodir: %02X", pe8.iodir);
        writefln("olat: %02X", pe8.olat);
        writeln("reset_n, halt_n low.");
    }
    if( param == "1" || param == "" ) {
        pe8.olat = pe8.olat | mask;
        writefln("iodir: %02X", pe8.iodir);
        writefln("olat: %02X", pe8.olat);
        writeln("reset_n, halt_n high.");
    }

    return 0;
}