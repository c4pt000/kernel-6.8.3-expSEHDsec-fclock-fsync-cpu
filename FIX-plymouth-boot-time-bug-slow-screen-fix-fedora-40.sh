rpm -qa | grep plymouth > remove-plymouth.txt
sed -i 's/^/rpm -e --nodeps /g' remove-plymouth.txt 
chmod +x remove-plymouth.txt 
./remove-plymouth.txt 



dnf install plymouth plymouth-core-libs plymouth-devel plymouth-graphics-libs plymouth-plugin* plymouth-scripts plymouth-system-theme plymouth-theme* --releasever=28 --allowerasing -y
plymouth-set-default-theme tribar -R

echo "add an exclude line to your /etc/dnf/dnf/conf to prevent plymouth from updating"

echo "exclude=plymouth*,your-other-exclude-here*"
