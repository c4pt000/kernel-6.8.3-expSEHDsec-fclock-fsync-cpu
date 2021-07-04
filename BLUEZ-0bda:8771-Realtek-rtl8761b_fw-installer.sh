#0bda:8771 Realtek Semiconductor Corp. Bluetooth Radio


wget https://raw.githubusercontent.com/Realtek-OpenSource/android_hardware_realtek/rtk1395/bt/rtkbt/Firmware/BT/rtl8761b_fw 

cp -rf rtl8761b_fw /usr/lib/firmware/rtl_bt/rtl8761b_fw.bin 

wget https://raw.githubusercontent.com/Realtek-OpenSource/android_hardware_realtek/rtk1395/bt/rtkbt/Firmware/BT/rtl8761b_config 

cp -rf rtl8761b_config /usr/lib/firmware/rtl_bt/rtl8761b_config.bin 
