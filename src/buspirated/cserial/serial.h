#ifndef _SERIAL_H_
#define _SERIAL_H_

int serial_open(const char *port, int baudrate );

int serial_timeout(int fd, int vmin, int vtime);

int serial_readbyte( int fd, char *b );

int serial_writebyte( int fd, char b );

#endif
