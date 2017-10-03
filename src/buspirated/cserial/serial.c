#include <stdio.h>   /* Standard input/output definitions */
#include <string.h>  /* String function definitions */
#include <unistd.h>  /* UNIX standard function definitions */
#include <fcntl.h>   /* File control definitions */
#include <errno.h>   /* Error number definitions */
#include <termios.h> /* POSIX terminal control definitions */
#include <stdint.h>
#include <sys/ioctl.h>

#include "serial.h"

static int get_baudrate_value(int baudrate) {
    int value;
    switch(baudrate) {
        case 9600: value = B9600; break;
        case 19200: value = B19200; break;
        case 38400: value = B38400; break;
        case 57600: value = B57600; break;
        case 115200: value = B115200; break;
        default: value = B115200; break;
    }
    return value;
}

static int set_interface_attribs(int fd, int baudrate) {
    struct termios tty;

    if (tcgetattr(fd, &tty) < 0) {
        printf("Error from tcgetattr: %s\n", strerror(errno));
        return -1;
    }

    speed_t speed = get_baudrate_value(baudrate);
    cfsetospeed(&tty, (speed_t)speed);
    cfsetispeed(&tty, (speed_t)speed);

    tty.c_cflag |= (CLOCAL | CREAD);    /* ignore modem controls */
    tty.c_cflag &= ~CSIZE;
    tty.c_cflag |= CS8;         /* 8-bit characters */
    tty.c_cflag &= ~PARENB;     /* no parity bit */
    tty.c_cflag &= ~CSTOPB;     /* only need 1 stop bit */
    tty.c_cflag &= ~CRTSCTS;    /* no hardware flowcontrol */

    /* setup for non-canonical mode */
    tty.c_iflag &= ~(IGNBRK | BRKINT | PARMRK | ISTRIP | INLCR | IGNCR | ICRNL | IXON);
    tty.c_lflag &= ~(ECHO | ECHONL | ICANON | ISIG | IEXTEN);
    tty.c_oflag &= ~OPOST;

    /* non-blocking reads, no timeout */
    tty.c_cc[VMIN] = 0;
    tty.c_cc[VTIME] = 0;

    if (tcsetattr(fd, TCSANOW, &tty) != 0) {
        printf("Error from tcsetattr: %s\n", strerror(errno));
        return -1;
    }
    return 0;
}

int serial_timeout(int fd, int vmin, int vtime) {
    struct termios tty;
    if (tcgetattr(fd, &tty) < 0) {
        printf("Error from tcgetattr: %s\n", strerror(errno));
        return -1;
    }
    /*
        VMIN = 0, VTIME = 0: non-blocking read.
        VMIN = 0, VTIME > 0: pure timed read. block until data available or timeout.
        VMIM > 0, VTIME > 0: VTIME is intercharacter time out. Blocking wait until data.
        VMIN > 0, VTIME = 0: Block until VMIN characters received.
    */
    tty.c_cc[VMIN] = vmin;
    tty.c_cc[VTIME] = vtime; // timeout 1 == 100ms

    if (tcsetattr(fd, TCSANOW, &tty) != 0) {
        printf("Error from tcsetattr: %s\n", strerror(errno));
        return -1;
    }
    return 0;
}

int serial_open(const char *port, int baudrate ) {
    printf("Opening port %s\n", port);
    int fd = open(port, O_RDWR | O_NOCTTY /*| O_NDELAY*/);
    if( fd == -1) {
        return -1;
    }
    if( set_interface_attribs(fd, baudrate) < 0 ) {
        fprintf(stderr, "Cannot setup serial port\n");
    }
    return fd;
}

void serial_close( int fd ) {
    if ( fd >= 0 ) {
        close( fd );
    }
}

int serial_readbyte( int fd, char *b ) {
    int ret = read(fd, b, 1);
    return ret;
}

int serial_writebyte( int fd, char b ) {
    printf("%02x\n", b);
    return write(fd, &b, 1);
}

int serial_bytes_available( int fd ) {
    int bytes_avail;
    ioctl(fd, FIONREAD, &bytes_avail);
    return bytes_avail;
}

/*
int main() {
    int fd = serial_open( "/dev/ttyUSB1", B115200);
    serial_timeout(fd, 0, 5);
    //write( fd, "?\r\n", 3);
    int i;
    for(i = 0; i<256; i++) {
        unsigned char b,c;
        c=i;
        write(fd, &c, 1);
        read(fd, &b, 1);
        printf("0x%02X 0x%02X\n", i, b);
        if ( c != b ) printf("ERROR\n");
    }
    return 0;
}
*/