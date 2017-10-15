import std.stdio;
import dserial;
import portexpander;
import core.thread;


int main(string[] args)
{
	if( args.length < 2 ) {
		writeln("Port name missing");
		return 1;
	}
    SerialPort p = new SerialPort();
	
    p.open(args[1], 115200);

    PortExpander pe = new PortExpander( &p, 0x20 );

    if( pe.probeBusPirate() ) {
        writeln("Bus Pirate gefunden!");
    } else {
        writeln("Kein Bus Pirate gefunden.");
        return 2;
    }

	return 0;
}