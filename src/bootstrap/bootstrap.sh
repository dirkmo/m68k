#!/bin/bash

DEVICE="$1"

if [ ! -a "$DEVICE" ]; then
    echo "Device ${DEVICE} not found."
    exit 1
fi

stty "-F ${DEVICE} 115200 raw min 1 time 5"

set -x
# I2C mode
echo "m 4 4" > ${DEVICE}
# enable power supply
echo "W" > ${DEVICE}

# 01 bit 0: bootstrap
# 02 bit 1: dtack_trigger
# 04 bit 2: reset
# 08 bit 3: halt
# 10 bit 4: r/w

# perform reset
# set reset, halt low
echo "[ 0x42 0x0A 0x00 ]" > ${DEVICE}
# reset, halt as output
echo "[ 0x42 0x00 0x13 ]" > ${DEVICE}
# all pins as input
echo "[ 0x42 0x0A 0xFF ]" > ${DEVICE}
