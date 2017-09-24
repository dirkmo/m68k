#!/usr/bin/python

# portexpander MCP23S08

import buspirate

class PortExpander(buspirate.BusPirate):
    # Register map
    REG_IODIR   = 0x00
    REG_IPOL    = 0x01
    REG_GPINTEN = 0x02
    REG_DEFVAL  = 0x03
    REG_INTCON  = 0x04
    REG_IOCON   = 0x05
    REG_GPPU    = 0x06
    REG_INTF    = 0x07
    REG_INTCAP  = 0x08
    REG_GPIO    = 0x09
    REG_OLAT    = 0x0A

    HIGH = 0
    LOW  = 1

    CONN_SPI = 1
    CONN_I2C = 2


    def __init__(self, portname, address, con ):
        super(type(self), self).__init__(portname)
        self._addr = address
        self._dir = 0
        self._outp = 0
        self._inp = 0
        self._con = con


    def read(self, reg):
        # read byte via spi from portexpander
        # reg: 8 bit register address
        # return: received byte from portexpander
        txb = bytearray(3)
        txb[0] = self._addr | 1      # read access
        txb[1] = reg & 0xFF          # register address byte
        rxb = self.spi_transfer(txb)
        return rxb[2]


    def write(self, reg, data):
        # write bytes via spi to shocklogger
        # reg: 8 bit register address
        # data: bytearray with data to send, max len 16 bytes.
        txb = bytearray(+3)
        txb[0] = self._addr | 0     # write access
        txb[1] = reg & 0xFF         # register address byte
        txb[2] = data & 0xFF
        self.spi_transfer(txb)


    def setIoDir(self, portdir):
        # byte of 8 bits define portexpander io direction
        # bit value 0 means output, bit value 1 means input
        self.write(self.REG_IODIR, portdir & 0xFF)


    def setPort(self, data):
        self.write( self.REG_GPIO, data )


    def getPort(self):
        return self.read( self.REG_GPIO )


def main():
    pe = PortExpander("COM7", 0x40, PortExpander.CONN_I2C)
    pe.setIoDir(~(1<<4)) #GP4=RESET
    pe.setPort(0<<4)


if __name__ == "__main__":
    main()
