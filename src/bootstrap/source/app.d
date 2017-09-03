import std.stdio, std.getopt, std.path;
import std.exception;

string sSerialport;
string sAddress;
string[] lines;
string sFilename;

int readFile( ) {
	try {
		File file = File(sFilename, "r");
		while( !file.eof() ) {
			string s = file.readln();
			lines ~= s;
		}
	} catch( Exception e ) {
		return -1;
	}
	return 0;
}

int main(string[] args)
{
	auto opts = getopt(
		args,
		"s|serial", "serial port with bus pirate", &sSerialport,
		"f|file", "hex filename", &sFilename,
		"a|address", "destination address in eeprom", &sAddress);

	if (opts.helpWanted)
	{
		defaultGetoptPrinter("m68k computer bootstrap program", opts.options);
	}

	if( readFile() < 0 ) {
		writeln("ERROR: Cannot read file '" , sFilename, "'");
		return -1;
	}

	foreach( s; lines ) {
		write(s);
	}
	return 0;
}
