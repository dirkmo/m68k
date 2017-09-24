#!/usr/bin/python

import portexpander
import buspirate
import sys
import os
import json

pe = None # portexpander
cd = None # config dictionary

RESET = (1<<4) # reset is on GP4
STOPCHARGE = (1<<2) # stop_charge is on GP2
SLOWCHARGE = (1<<6) # slowcharge on GP6

def readConfigFile():
    global cd
    with open( sys.argv[1] ) as f:
        cd = json.load(f)


def main():
    global cd
    global pe
    if len(sys.argv) < 2:
        print sys.argv[0] + " <configfile.json>"
        sys.exit(1)

    try:
        readConfigFile()
    except Exception as e:
        print "Error reading config file " + sys.argv[1]
        exit(1)

    pe = portexpander.PortExpander( cd["buspirate_portexpander"]["serial"], cd["buspirate_portexpander"]["address"] )
    pe.setIoDir( ~(RESET | STOPCHARGE | SLOWCHARGE) ) # GP2, GP4, GP6 as output

    if len(sys.argv) == 2 or sys.argv[2] == "reset":
        print "reset"
        pe.setPort( RESET )
    if len(sys.argv) == 2 or sys.argv[2] == "release":
        print "release"
        pe.setPort( 0 )
    if len(sys.argv) == 3:
        port = pe.getPort()
        if sys.argv[2] == "charge":
            print "charge"
            port |= STOPCHARGE
        if sys.argv[2] == "stopcharge":
            print "stop charge"
            port &= ~STOPCHARGE
        print "portval:", port
        pe.setPort(port)


if __name__ == "__main__":
    main()
