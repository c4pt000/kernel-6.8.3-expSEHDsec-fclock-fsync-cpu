#!/bin/sh
echo "does a complete un-xz zip of /usr/lib/firmware to also enable rtw88_8822ce realtek wifi" 
yum install linux-firmware -y
cd /usr/lib/firmware
find . -type f -exec unxz * {} +
rmmod -f rtw88_8822ce
modprobe rtw88_8822ce
iwconfig
