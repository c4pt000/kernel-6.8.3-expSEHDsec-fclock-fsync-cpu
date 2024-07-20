rpm -qa | grep plymouth > remove-plymouth.txt
sed -i 's/^/rpm -e --nodeps /g' remove-plymouth.txt 
chmod +x remove-plymouth.txt 
./remove-plymouth.txt 



dnf install plymouth plymouth-core-libs plymouth-devel plymouth-graphics-libs plymouth-plugin* plymouth-scripts plymouth-system-theme plymouth-theme* --releasever=34 --allowerasing -y
