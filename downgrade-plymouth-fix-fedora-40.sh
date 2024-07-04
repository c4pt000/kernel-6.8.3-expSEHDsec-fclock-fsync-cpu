#!/bin/sh
rpm -qa | grep plymouth > remove-plymouth.txt
sed -i 's/^/rpm -e --nodeps /g' remove-plymouth.txt 
chmod +x remove-plymouth.txt 
./remove-plymouth.txt 
			#dont downgrade kcm delete it because it basically pulls everything from f39		#dnf install  plymouth-kcm                            --releasever=39 --allowerasing -y



dnf install plymouth plymouth-devel plymouth-plugin-fade-throbber plymouth-plugin-label plymouth-plugin-script \
 plymouth-plugin-space-flares plymouth-plugin-two-step plymouth-scripts \
 plymouth-system-theme plymouth-theme-breeze plymouth-theme-charge plymouth-theme-fade-in \
 plymouth-theme-hot-dog plymouth-theme-script plymouth-theme-solar plymouth-theme-spinfinity \
 plymouth-theme-spinner --releasever=39 --allowerasing -y

rpm -e --nodeps plymouth-kcm
