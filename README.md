
# *** PUSH for uvc video support, 05-01-2019, for usb webcam support , what security kernel isnt complete without support for usb video?


* moon logo <p align="center"><img src="https://i.imgur.com/CAywHCC.png" width="80"></p>


(logo pulled from ios7 theme used with "clover bootloader" for booting ext4 drives)


* penguin logo <p align="center"><img src="https://i.imgur.com/mlFQ4sC.png" width="80"></p>



* penguin logo boot <p align="center"><img src="https://i.imgur.com/IdbMjql.jpg" width="400"></p>





* to select video modes @boot
* add:
* GRUB_CMDLINE_LINUX="vga=0x000
* rebuild grub.cfg

# * MOON LOGO

uvc device support http://www.ideasonboard.org/uvc/
<br>
<br>
<br>
<br>

RPMs
<br>
https://drive.google.com/open?id=1QKvcJRVaEVFDsU6-vPhaBBw8HdCehU2a
<br>
DEBs
<br>
https://drive.google.com/open?id=152FP7nYlrYi65969P2u6wayHJnuGbnYu
<br>
<br>
<br>

modprobe uvcvideo
<br>
modprobe hid_xpadneo

<br>
<br>
<br>
<p align="center"><img src="https://i.imgur.com/JOPT9Ka.png" width="3000"></p>

<br>
<br>


# * PENGUIN LOGO

uvc device support http://www.ideasonboard.org/uvc/
<br>
<br>
<br>
<br>
<br>

RPMs
<br>
https://drive.google.com/open?id=12rwMY_zURmwF2XFlIP8okePH4QAMIchH
<br>
DEBs
<br>
https://drive.google.com/open?id=1EJxOkGQtUvdHcQKOydxrcUQQSdY3jsq6
<br>



modprobe uvcvideo
<br>
modprobe hid_xpadneo

<br>
<br>
<br>
<p align="center"><img src="https://i.imgur.com/Q4EiiO2.png" width="800"></p>

<br>
<br>
<br>
<br>
<br>
<br>
<br>


# kernel-4.4.167expSEHDsec
kernel-4.4.167expSEHDsec
"hardware candy" security kernel, 




## Fedora 28 only

nvidia + fglrx (100% working others still un-tested (amdgpu,etc)
<br>

compiler issues between gcc34, gcc8.3.1, gcc 4.8.5 only with fedora 
<br>
                                                               
to change still WIP,                                               
<br>

CONFIG_CC_STACKPROTECTOR_NONE=n
<br>

CONFIG_CC_STACKPROTECTOR_REGULAR=y
<br>

CONFIG_CC_STACKPROTECTOR_STRONG=n
<br>


 -fstack-protector-strong for gcc errors 
<br>

gmp-6.1.2-7.fc28.x86_64.rpm
<br>

gmp-4.3.2-3.fc15.x86_64.rpm



<br>
<br>
<br>
<br>
<br>
<br>
<br>



# * STUCK BOOT PROCESS in Fedora 28+ only
* (as single user different default kernel)
<br>
* sytemctl disable systemd-journald
<br>
<br>
* mv /usr/lib/systemd/systemd-journald /usr/lib/systemd/systemd-journald.orig
<br>
<br>
* mv /usr/bin/plymouthd /usr/bin/plymouthd.orig
<br>
<br>
* remove "resume= " line in grub
<br>
* rebuild grub.cfg
<br>
<br>
<br>
* 'untouched'

* /usr/bin/plymouth
<br>
* (plymouth *not* plymouthd might be essential and needed for lightdm or possible gdm (others) to execute)
<br>
<br>

# * FGLRX legacy HD 6XXX/7XXX support, (outside of AMDGPU, AMDGPU-PRO support) patched for 4.4,
<br>


<br>

* https://github.com/c4pt000/FGLRX-for-linux-4.4
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>





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


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


if you found this useful, anything helps

1C4XqNoP9QMPQicKBW4R4Dfmpz67YN7qCW

![s1](https://i.imgur.com/MVirCFO.png)


