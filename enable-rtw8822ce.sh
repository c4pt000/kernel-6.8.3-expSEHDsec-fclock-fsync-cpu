#!/bin/sh
echo "when kernel-devel-5.11.6-HAXM-expSEHDsec-c4pt000-amdNV-rtl88.x86_64.rpm is installed"
cd /usr/src/kernels/5.11.6-HAXM-expSEHDsec-c4pt000-amdNV-rtl88/drivers/net/wireless/realtek/rtw88/
make -j4
  make -j4 install
  modprobe rtl88x2ce
