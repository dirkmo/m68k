import std.stdio;
import dserial;
import portexpander;
import core.thread;

enum Expander {
    MCP23017 = 0x20,
    MCP23008 = 0x21
};

int main(string[] args)
{
	if( args.length < 2 ) {
		writeln("Port name missing");
		return 1;
	}
    SerialPort p = new SerialPort();
	
    p.open(args[1], 115200);

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

	return 0;
}