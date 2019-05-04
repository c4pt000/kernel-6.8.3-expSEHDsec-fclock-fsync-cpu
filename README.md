
# *** PUSH for uvc video support, 05-01-2019, for usb webcam support , what security kernel isnt complete without support for usb video?


* moon logo <p align="center"><img src="https://i.imgur.com/CAywHCC.png" width="80"></p>


* penguin logo <p align="center"><img src="https://i.imgur.com/mlFQ4sC.png" width="80"></p>



* penguin logo boot <p align="center"><img src="https://i.imgur.com/IdbMjql.jpg" width="400"></p>





# * MOON LOGO

uvc device support http://www.ideasonboard.org/uvc/

RPM + DEB

https://drive.google.com/file/d/1t_NKSJAuMOw23QblFXu5UgkC9kLLoekP/view

modprobe uvcvideo



(logo pulled from ios7 theme used with "clover bootloader" for booting ext4 drives)

# * PENGUIN LOGO

uvc device support http://www.ideasonboard.org/uvc/

RPM + DEB

https://drive.google.com/uc?id=1ojpmue2IUI5CjAMei6KOizOC51-wwJMU&export=download


modprobe uvcvideo




# kernel-4.4.167expSEHDsec_XPAD1_tg3_moonlogo_KVM.x86_64
kernel-4.4.167expSEHDsec_XPAD1_tg3_moonlogo_KVM.x86_64
"hardware candy" security kernel, 

## label this as a **WIP**

# *new push for Docker support 

same as before RENO for TCP instead of CUBIC, packet generator module, different IPSEC stacks, hardware events, different dyntick, kobject loading, prelimenary stack protection with RAM, different userspace protection from debugging, basic SMACK policies, SELINUX, no TOMOYO, no apparmor by default 

* CONFIG_DEFAULT_SECURITY_SELINUX=y
* CONFIG_SECURITY_SMACK=y
* CONFIG_SECURITY_APPARMOR=y
* --> CONFIG_SECURITY_TOMOYO is not set
* --> CONFIG_DEFAULT_SECURITY_APPARMOR is not set

for fglrx see FGLRX graphics support patched installer for 4.4

* CONFIG_DRM_RADEON=m
* CONFIG_DRM_RADEON_USERPTR=y
* --> CONFIG_DRM_RADEON_UMS is not set
* CONFIG_DRM_AMDGPU=m
* CONFIG_DRM_AMDGPU_CIK=y
* CONFIG_DRM_AMDGPU_USERPTR=y
* CONFIG_DRM_NOUVEAU=m
* CONFIG_NOUVEAU_DEBUG=5
* CONFIG_NOUVEAU_DEBUG_DEFAULT=3
* CONFIG_DRM_NOUVEAU_BACKLIGHT=y

RHEL/CentOS/Fedora based RPMS, based on kernel 4.4, for FGLRX graphics, and experimental security functions, moonLogo on boot with grub options, "vga=0x346", also Broadcom TIGON3 gigabit ethernet for hp class machines, and MT7610U usb wifi 802.11ac for wavlink mediatek devices (not 100% working as a kernel module seperate meditatek mt7610u drivers below),
https://github.com/c4pt000/mt7610u_wifi_sta_v3002_dpo_20130916

(support for xbox one wired controllers, possibly legacy xbox 360 wired controllers)

modprobe hid_xpadneo

##
##

02-07-2019
* push for i915 support, intel graphics
https://drive.google.com/open?id=1zz0nqB3DOYScDOZm43kkjs1H4oJavTjH

rpms (01-07-2019- push for NBD(qemu-img), OVERLAY-FS, NFS options) *Docker support enabled

* https://drive.google.com/open?id=1BsXnWMyJ5Tu2jYBr27SXLvya-bAqf983

.debs (untested)

* https://drive.google.com/open?id=1-RpxCWD9Hml09cEToIrdNyU0he8xZvc0

FGLRX legacy HD 6XXX/7XXX support, (outside of AMDGPU, AMDGPU-PRO support)
patched for 4.4,

* https://drive.google.com/open?id=1P0ruOAmVcjLXTM02hSiVXsl68NULzUeK



(compiz-fusion-plugins-experimental       RPM only.,     since the experimental plugins are more widely available on deb based linux)

* https://drive.google.com/open?id=1Jo34N_tVUwOXMQxVPZ-MrIneTowOOG_Z




if you found this useful, anything helps

1C4XqNoP9QMPQicKBW4R4Dfmpz67YN7qCW

![s1](https://i.imgur.com/MVirCFO.png)


