#!/bin/bash
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.11.6.tar.xz
tar -xvf linux-5.11.6.tar.xz
mv linux-5.11.6 kernel-5.11.6_penguin_expSEHDsec+T
cd kernel-5.11.6_penguin_expSEHDsec+T
wget https://raw.githubusercontent.com/c4pt000/kernel-5.11.0-expSEHDsec/master/config-5.11.6-penguin-expSEHDsec%2BT 
cp -rf config-5.11.6-penguin-expSEHDsec+T .config
cd drivers/video/
mv logo logo.null
wget https://github.com/c4pt000/kernel-5.11.0-expSEHDsec/raw/master/logo.tar.gz
tar -xvf logo.tar.gz 
cd ../../
cd drivers/input/
mv joystick joystick.null
wget https://github.com/c4pt000/kernel-5.11.0-expSEHDsec/raw/master/joystick.tar.gz
tar -xvf joystick.tar.gz
cd ../../../kernel-5.11.6_penguin_expSEHDsec+T/
make -j24 rpm-pkg
cd /root/rpmbuild/RPMS/x86_64/
ls -lah
