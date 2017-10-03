module dserial;

import std.stdio;
import std.string;
import core.thread;
import std.conv;


extern (C) int serial_open(const char *port, int baudrate );
extern (C) int serial_timeout(int fd, int vmin, int vtime);
extern (C) int serial_readbyte( int fd, char *b );
extern (C) int serial_writebyte( int fd, char b );
extern (C) int serial_bytes_available( int fd );
extern (C) void serial_close( int fd );

class SerialPort {

	/// open serial port
	bool open( string port, int baudrate ) {
		fd = serial_open( std.string.toStringz(port), baudrate );
		return fd >= 0;
	}

	/// write data to serial port
	void write( char[] data ) {
		foreach ( d ; data ) {
			serial_writebyte(fd, d);
		}
	}

	/// read data from serial port
	int read( ref char[] data, int count ) {
		char b;
		int reccount = 0;
		if( count == 0 ) {
			count = -1; // read as many bytes as possible
		}
		while( count != 0 ) {
			if( serial_readbyte( fd, &b ) > 0 ) {
				data ~= b;
				reccount++;
			} else {
				break;
			}
			count--;
		}
		return reccount;
	}
	
    /// flush received bytes.
	/// may block if in blocking mode.
	int flush() {
		int count = 0;
		char b;
		if( serial_bytes_available(fd) > 0 ) {
			while( serial_readbyte( fd, &b ) > 0 ) {
				count++;
			}
		}
		return count;
	}

    /// block until charCount characters received.
    bool modeBlock( uint charCount ) {
        return serial_timeout(fd, charCount, 0) == 0;
    }

    /// block until data received or timeout.
    bool modeBlockWithTimeout( uint timeout_100ms ) {
        return serial_timeout(fd, 0, timeout_100ms ) == 0;
    }

    /** block until first char received. Then receive until vmin
        chars received or timeout. */
    bool modeBlockWithInterCharTimeout( uint vmin, uint timeout_100ms ) {
        return serial_timeout(fd, vmin, timeout_100ms ) == 0;
    }

    /// non blocking mode
    bool modeNonBlocking() {
        return serial_timeout(fd, 0, 0) == 0;
    }

	uint bytesAvailable() {
		return serial_bytes_available(fd);
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
