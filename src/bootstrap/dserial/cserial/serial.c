#include <stdio.h>   /* Standard input/output definitions */
#include <string.h>  /* String function definitions */
#include <unistd.h>  /* UNIX standard function definitions */
#include <fcntl.h>   /* File control definitions */
#include <errno.h>   /* Error number definitions */
#include <termios.h> /* POSIX terminal control definitions */
#include <stdint.h>
#include <sys/ioctl.h>
#include <stdlib.h>


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

int serial_read( int fd, char *dat, int len ) {
    int ret = read(fd, dat, len);
    //printf("%02x\n", *b);
    return ret;
}

int serial_write( int fd, const char *dat, int len ) {
    //printf("%02x\n", b);
    return write(fd, dat, len);
}

int serial_bytes_available( int fd ) {
    int bytes_avail;
    ioctl(fd, FIONREAD, &bytes_avail);
    return bytes_avail;
}

#ifdef __EXEC__
int main(int argc, char **argv) {
    if ( argc < 3 ) {
        printf("serial [port] [data]\n");
        return 1;
    }
    int fd = serial_open( argv[1], 115200);
    if( fd == -1 ) {
        printf("Cannot open port %s\n", argv[1]);
        return 2;
    }
    int i;
    char data[argc-2];
    for ( i = 2; i < argc; i++) {
        data[i-2] = strtoul(argv[i], NULL, 16);
    }

    write( fd, data, argc-2 );
    usleep(100*1000);

    char b;
    while(read(fd, &b, 1) > 0) {
        printf("%02X", b);
    }
    printf("\n");
    return 0;
}
#endif
