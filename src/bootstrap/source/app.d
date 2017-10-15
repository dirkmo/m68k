import std.stdio;
import dserial;
import core.thread;

int main(string[] args)
{
	if( args.length < 2 ) {
		writeln("Port name missing");
		return 1;
	}
    SerialPort p = new SerialPort();
	
    p.open(args[1], 115200);

	p.write( ['?', '\r', '\n'] );

	Thread.sleep( dur!("msecs")(500) );

	char[] data;
	p.read( data, 0 );
	write(data);

	return 0;
}