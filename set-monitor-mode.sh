ip link set wlo1 down
iw dev wlo1 set type monitor
rfkill unblock all
ip link set wlo1 up
iwconfig 
