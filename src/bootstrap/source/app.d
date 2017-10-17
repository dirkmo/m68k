import std.stdio;
import dserial;
import portexpander;
import core.thread;

enum Expander {
    MCP23017 = 0x20,
    MCP23008 = 0x21
}

int main(string[] args)
{
    string port;
    version(linux) { port = "/dev/ttyUSB-lalalala"; }
    version(OSX)   { port = "/dev/cu.usbserial-AL03NOWB"; }
	if( args.length > 1 ) {
		port = args[1];
	}
    SerialPort p = new SerialPort();
	
    if( ! p.open(port, 115200) ) {
        writefln("ERROR: Failed to open port %s", port);
        return 1;
    }

    PortExpander pe16 = new PortExpander( &p, Expander.MCP23017 );
    PortExpander pe8 = new PortExpander( &p, Expander.MCP23008 );

    if( !pe8.probeBusPirate() ) {
        writeln("No Bus Pirate found.");
        return 2;
    }

    if( pe8.discover() ) {
        writefln("MCP23008 found on address 0x%02X", pe8.i2cAddr);
    }
    if( pe16.discover() ) {
        writefln("MCP23017 found on address 0x%02X", pe16.i2cAddr);
    }

    ubyte value;
    pe8.getRegister( PortExpander.Register.olat, value);
    writefln("Value: %02X", value);    
    pe8.setRegister(PortExpander.Register.olat, 0x78);
    pe8.getRegister( PortExpander.Register.olat, value);
    writefln("Value: %02X", value);    
    
	return 0;
}