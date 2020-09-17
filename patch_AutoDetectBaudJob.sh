#!/bin/bash

# Cura since V3 has a Python script used for detecting the baud rate of USB printers
# This script uses the M105 Gcode to try and poll the printers extruder temp
# The expected response used to detect the printer doesn't match the behavior of the Maker Select v2 (MSv2)
# The original Python script expects the response from M105 to have "ok" and "T:" on the same line
# The MSv2 replies with "ok" and "T:" on two separate lines, so it will never satisfy the requirement
# The MSv2 returns a "start" each time a new connection is established
# By adding an OR conditional that checks for "start", the Baud Job script will correctly identify the baud rate
# (which happens to be 115200 which is the first one tried)

if [$1 -eq ""]
then
    echo "Please provide the directory path for Cura as an argument"
else
    scriptFilePath="$1/plugins/USBPrinting/AutoDetectBaudJob.py"
    echo "Patching python script: $scriptFilePath"
    sed -i 's/if b"ok" in line and b"T:" in line:/if (b"ok" in line and b"T:" in line) or (b"start" in line):/g' "$scriptFilePath"
    echo "Patch complete"
fi

