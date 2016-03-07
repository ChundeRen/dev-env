#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

# Powertop suggestions
echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
#/sbin/iw dev wlan0 set power_save on

# Kernel Bug on Macbook Pro ? (kworker CPU high)
status=`cat /sys/firmware/acpi/interrupts/gpe06 | grep disable | wc -c`
if [ $status -eq 0 ]; then
    echo disable > /sys/firmware/acpi/interrupts/gpe06
fi
status=`cat /sys/firmware/acpi/interrupts/gpe17 | grep disable | wc -c`
if [ $status -eq 0 ]; then
    echo disable > /sys/firmware/acpi/interrupts/gpe17
fi

exit 0
