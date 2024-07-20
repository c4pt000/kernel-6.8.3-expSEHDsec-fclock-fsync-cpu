rpm -qa | grep plymouth > remove-plymouth.txt
sed -i 's/^/rpm -e --nodeps /g' remove-plymouth.txt 
chmod +x remove-plymouth.txt 
./remove-plymouth.txt
