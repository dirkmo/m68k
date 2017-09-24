#!/usr/bin/python

import serial
import sys


# 00000001 – Mode version string (I2C1)
# 00000010 – Send I2C start bit
# 00000011 – Send I2C stop bit
# 00000100 – I2C read byte
# 00000110 – Send I2C ACK bit
# 00000111 – Send I2C NACK bit
# 00001111 – Start bus sniffer
# 0001xxxx – Bulk transfer, send 1-16 bytes (0=1byte!)
# 0100wxyz – Configure peripherals w=power, x=pullups, y=AUX, z=CS
# 011000xx – Set I2C speed, 3=~400kHz, 2=~100kHz, 1=~50kHz, 0=~5kHz

class BusPirate(object):

    SPI_CS_LOW  = 0x02
    SPI_CS_HIGH = 0x03
    SPI_RXTX    = 0x10
    SPI_CFG     = 0x8A #3.3V, CLK idle low, CLK edge active to idle, sample in middle
    SPI_PWRON   = 0x49 #enable 3.3V power supply, pullups=0, aux=0, CS=1

    I2C_START = 0x02
    I2C_STOP  = 0x03
    I2C_SPEED = 0x33 # 400 kHz

    BPMODE_UNKNOWN = 0
    BPMODE_BINARY = 1
    BPMODE_SPI = 2
    BPMODE_I2C = 3

    def enter_binary_mode(self):
        count = 0
        # enter binary bitbang mode with reduced timeout
        timeout = self.ser.timeout
        self.ser.timeout=0.02
        while count < 25:
            count += 1
            self.ser.flush()
            self.ser.write('\x00')
            answer = self.ser.read(5)
            if answer == 'BBIO1':
                break
        self.ser.timeout = timeout
        if count == 25:
            self._mode = self.BPMODE_UNKNOWN
            print "Failed to enter binary mode"
            return False
        self._mode = self.BPMODE_BINARY
        return True


    def enter_spi_mode(self):
        self.ser.flush()
        # enter SPI mode
        self.ser.write('\x01')
        answer = self.ser.read(4)
        if answer != 'SPI1':
            print "Failed to enter SPI mode"
            return False
        self._mode = self.BPMODE_SPI
        self.cmd( self.SPI_CFG )
        self.cmd( self.SPI_PWRON )
        return True


    def enter_i2c_mode(self):
        self.ser.flush()
        # enter i2c mode
        self.ser.write('\x02')
        answer = self.ser.read(4)
        if answer != 'I2C1':
            print "Failed to enter SPI mode"
            return False
        self._mode = self.BPMODE_I2C
        self.cmd( self.I2C_SPEED )
        return True


    def set_i2c_address(self, addr):
        self._i2caddr = addr


    def leave_binary_mode(self):
        self.ser.flush()
        # leave SPI mode
        self.ser.write('\x00')
        answer = self.ser.read(5)
        if answer != 'BBIO1':
            print "Error leaving SPI/I2C mode"
            return False
        self.ser.flush()
        # reset bus pirate to return to console mode
        self.ser.write('\x0F')
        answer = self.ser.read(1)
        if answer != '\x01':
            print "Error leaving binary mode"
            return False
        return True


    def cmd(self, cmd):
        if self._mode == self.BPMODE_UNKNOWN:
            return False
        # send bus pirate command and expect 0x01 as ACK
        self.ser.flush()
        self.ser.write(chr(cmd))
        ret = self.ser.read(1)
        #print "Send:", format(cmd, '02X'), "rec:", format(ord(ret[0]), '02X')
        if ret != '\x01':
            print "ERROR command", repr(cmd), repr(ret)
        return ret == '\x01'


    def spi_transfer(self, txb):
        # send txb bytearray via bus pirate binary spi mode
        if self._mode != self.BPMODE_SPI:
            if not self.enter_binary_mode() or not self.enter_spi_mode():
                raise Exception('Cannot enter spi mode')
        count = len(txb)
        bc = count - 1
        if count < 1:
            print "ERROR: No bytes in array"
            return bytearray(0)
        if count > 16:
            print "ERROR: Too many bytes in transfer (max: 16)"
            return bytearray(0)
        # create receive buffer
        rxb = bytearray(count)
        # CS low
        self.cmd(self.SPI_CS_LOW)
        # SPI bulk transfer command
        self.cmd(self.SPI_RXTX | bc)
        self.ser.flush()
        # send bytes
        for i in range(count):
            self.ser.write(chr(txb[i]))
            rxb[i] = self.ser.read(1)
            #print "tx: " + hex(txb[i]) + ", rx: " + hex(rxb[i])
        # CS high
        self.cmd(self.SPI_CS_HIGH)
        self.ser.flush()
        return rxb


    def i2c_transfer(self, txb):
        print "bla"


    def __init__(self, portname):
        _mode = self.BPMODE_UNKNOWN
        self.ser = serial.Serial(port=portname, baudrate=115200, timeout=0.1)
        if not self.enter_binary_mode():
            raise Exception( 'Unable to enter binary mode' )


def main():
    bp = BusPirate( "/dev/ttyUSB0" )


if __name__ == "__main__":
    main()

