#!/bin/sh
rpm -qa | grep cryptsetup > remove-cryptsetup.txt
sed -i 's/^/rpm -e --nodeps /g' remove-cryptsetup.txt 
chmod +x remove-cryptsetup.txt 
./remove-cryptsetup.txt 



dnf install cryptsetup cryptsetup-libs --releasever=39 -y
