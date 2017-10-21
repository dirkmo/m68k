import core.thread;
import core.stdc.stdlib;
import control;
import databus;
import dserial;
import std.stdio;

enum Expander {
    MCP23017 = 0x20,
    MCP23008 = 0x21
}

SerialPort serialport;
Control ctrl;
DataBus db;

void init( string[] args ) {
    string port;
    version(linux) { port = "/dev/serial/by-id/usb-FTDI_FT232R_USB_UART_AL03NOWB-if00-port0"; }
    version(OSX)   { port = "/dev/cu.usbserial-AL03NOWB"; }
	if( args.length > 1 ) {
		port = args[1];
	}
    serialport = new SerialPort();
	
    if( ! serialport.open(port, 115200) ) {
        writefln("ERROR: Failed to open port %s", port);
        exit(1);
    }

    ctrl = new Control( serialport );

    if( !ctrl.init() ) {
        writeln("MCP23008 not found.");
        exit(2);
    }

    db = new DataBus( serialport );
    if( !db.init() ) {
        writeln("MCP23017 not found.");
        exit(3);
    }
}


void write_word( ushort value ) {
    enum NOP = 0x1234;
    ctrl.rw = 1;
    ctrl.reset = false;
    // cpu wartet nun auf erstes Wort

    // EEProm beschreiben
    db.output( value );
    ctrl.rw = 0;
    ctrl.rw = 1;

    // CPU ein NOP geben
    db.output( NOP );
    ctrl.dtack();

}

int main(string[] args)
{
    writeln("m68k Bootstrap program");
    init( args );
    writeln("Portexpander ready.");
    writeln("Putting MC68SEC000 into reset...");

    db.highz();

    ctrl.reset = true;
    // bootstrap mode starten
    ctrl.boot = true;
    // cpu laufen lassen
    ctrl.reset = false;

    write_word( 0 );

    // bootstrap mode beenden
    ctrl.boot(false);
    
    // restart cpu
    ctrl.reset = true;
    db.highz();
    ctrl.highz();
    
	return 0;
}