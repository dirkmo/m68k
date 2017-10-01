module dserial;

import std.stdio;
import std.string;
import core.thread;
import std.conv;


extern (C) int serial_open(const char *port, int baudrate );
extern (C) int serial_timeout(int fd, int vmin, int vtime);
extern (C) int serial_readbyte( int fd, char *b );
extern (C) int serial_writebyte( int fd, char b );
extern (C) void serial_close( int fd );

class SerialPort {
	
	enum baudrates {
		B9600  = octal!15,
		B19200 = octal!16,
		B38400 = octal!17,
		B57600 = octal!10001,
		B115200 = octal!10002
	}

	bool open( string port, int baud ) {
		int baudrate;
		switch( baud ) {
			case 9600: baudrate = baudrates.B9600; break;
			case 19200: baudrate = baudrates.B19200; break;
			case 38400: baudrate = baudrates.B38400; break;
			case 57600: baudrate = baudrates.B57600; break;
			case 115200: baudrate = baudrates.B115200; break;
			default: baudrate = baudrates.B115200;
		}
		fd = serial_open( std.string.toStringz(port), baudrate );
		return fd >= 0;
	}

	void write( char[] data ) {
		foreach ( d ; data ) {
			serial_writebyte(fd, d);
		}
	}

	int read( ref char[] data, int count ) {
		char b;
		int reccount = 0;
		if( count == 0 ) {
			count = -1; // read as many bytes as possible
		}
		while( count != 0 ) {
			if( serial_readbyte( fd, &b ) > 0 ) {
//				std.stdio.write(b);
				data ~= b;
				reccount++;
			} else {
				break;
			}
			count--;
		}
		return reccount;
	}
	
    /// flush received bytes
	int flush() {
		int count = 0;
		char b;
		while( serial_readbyte( fd, &b ) > 0 ) {
			count++;
		}
		return count;
	}

    /// block until charCount characters received.
    bool block( uint charCount ) {
        return serial_timeout(fd, charCount, 0) == 0;
    }

    /// block until data received or timeout.
    bool blockWithTimeout( uint timeout_100ms ) {
        return serial_timeout(fd, 0, timeout_100ms ) == 0;
    }

    /** block until first char received. Then receive until vmin
        chars received or timeout. */
    bool blockWithInterCharTimeout( uint vmin, uint timeout_100ms ) {
        return serial_timeout(fd, vmin, timeout_100ms ) == 0;
    }

    /// non blocking mode
    bool nonBlocking() {
        return serial_timeout(fd, 0, 0) == 0;
    }

	private:
		int fd;
		uint m_timeout;
		bool blocking;
}
/*
int main( string[] args )
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
*/
