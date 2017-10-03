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
