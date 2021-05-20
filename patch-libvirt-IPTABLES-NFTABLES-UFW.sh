#!/bin/bash

echo 'Fedora 34 users mostly for virsh and nftable support'
echo 'virsh net-autostart && virsh net-start replace and fix for fedora outdating "iptables" for nftables'
echo '*****REVIEW SCRIPT, SCRIPT WILL PAUSE FOR 5 SECONDS CRTL-C to review SCRIPT********'
sleep 5s
setenforce 0
sleep 1s
yum install network-scripts-10.09-1.fc34.x86_64 -y
yum install iptables-utils-1.8.7-7.fc34.x86_64 -y
yum install iptables-compat-1.8.7-7.fc34.x86_64 -y
yum install iptables-nft-1.8.7-7.fc34.x86_64 -y
yum install iptables-libs-1.8.7-3.fc34.x86_64 -y

rpm -e --nodeps iptables-1.8.7-3.fc34.x86_64 
rpm -e --nodeps firewalld 
rpm -e --nodeps firewalld-filesystem 
rpm -e --nodeps iptables-legacy-libs-1.8.7-7.fc34.x86_64 
rpm -e --nodeps iptables-legacy-1.8.7-7.fc34.x86_64 



yum install ufw -y

ldconfig

#echo 'recommended ufw'
# ufw enable
# ufw status verbose
# ufw delete 1
# ufw delete 1
# ufw default deny outgoing
# ufw default deny incoming
# ufw allow out 53 
# ufw allow out 80  
# ufw allow out 443
# echo 'IPV6=no' >> /etc/ufw/ufw.conf
# ufw disable
# ufw enable
# echo 'add your outgoing ports as ufw allow out "port"'
# ufw status verbose



 systemctl restart libvirtd
 virsh net-start default
 virsh net-autostart default

set enforce 1
ausearch -c 'iptables' --raw | audit2allow -M my-iptables
semodule -X 300 -i my-iptables.pp
yum install NetworkManager-tui-1:1.30.4-1.fc34.x86_64 -y
