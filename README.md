
# *** PUSH for uvc video support, 05-01-2019, for usb webcam support , what security kernel isnt complete without support for usb video?


* moon logo <p align="center"><img src="https://i.imgur.com/CAywHCC.png" width="80"></p>


* penguin logo <p align="center"><img src="https://i.imgur.com/mlFQ4sC.png" width="80"></p>



* penguin logo boot <p align="center"><img src="https://i.imgur.com/IdbMjql.jpg" width="400"></p>





# * MOON LOGO

uvc device support http://www.ideasonboard.org/uvc/

RPM + DEB



modprobe uvcvideo

<br>
<br>
<br>
<br>
<br>

(logo pulled from ios7 theme used with "clover bootloader" for booting ext4 drives)

# * PENGUIN LOGO

uvc device support http://www.ideasonboard.org/uvc/

RPMs
https://drive.google.com/open?id=12rwMY_zURmwF2XFlIP8okePH4QAMIchH

DEBs
https://drive.google.com/open?id=1EJxOkGQtUvdHcQKOydxrcUQQSdY3jsq6



modprobe uvcvideo


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


# kernel-4.4.167expSEHDsec_XPAD1_tg3_moonlogo_KVM.x86_64
kernel-4.4.167expSEHDsec_XPAD1_tg3_moonlogo_KVM.x86_64
"hardware candy" security kernel, 




## Fedora 28

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




(as single user different default kernel)

sytemctl disable systemd-journald
<br>
<br>
mv /usr/lib/systemd/systemd-journald /usr/lib/systemd/systemd-journald.orig
<br>
<br>
cd /usr/sbin
<br>
<br>
mv plymouthd plymouthd



# * (for fglrx install)
<br>
<br>
install "devtoolset-2"

nano /etc/dnf/dnf.conf
<br>
<br>
exclude=xorg*fc28*,kernel-core*,xorg*fc15



add fedora-archive-18
<br>
<br>
#######################
<br>
<br>
cat /etc/yum.repos.d/fedora.arc.repo


<br>
<br>
[fedora-arc-18]
<br>
name=Fedora 18 - $basearch
<br>
failovermethod=priority
<br>
#baseurl=http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/
<br>
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-18&arch=$basearch
<br>
enabled=1
<br>
metadata_expire=7d
<br>
repo_gpgcheck=0
<br>
type=rpm
<br>
gpgcheck=1
<br>
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-18-$basearch
<br>
skip_if_unavailable=False


(rpm -qa | grep xorg) && (rpm -e --nodeps "all the current xorg" packages any conflicts)

yum install xorg-x11-* xorg-x11-server-Xorg

re edit dnf.conf to preserve and pin current xorg

(add xorg* here)
<br>
nano /etc/dnf/dnf.conf
<br>
exclude=xorg*fc28*,kernel-core*,xorg*fc15,xorg




## working xorg rpms for 4.4 + FGLRX
* xorg-x11-drv-evdev-2.7.3-2.fc18.x86_64
* xorg-x11-docs-1.6-5.fc18.noarch
* xorg-x11-drv-nv-2.1.20-2.fc18.x86_64
* xorg-x11-server-devel-1.13.0-11.fc18.x86_64
* xorg-x11-fonts-ISO8859-9-100dpi-7.5-6.fc18.noarch
* xorg-x11-drv-mouse-devel-1.8.1-3.fc18.x86_64
* xorg-x11-drv-keyboard-1.6.2-3.fc18.x86_64
* xorg-x11-server-Xspice-0.0.22-5.20120718gitde6620788.fc18.x86_64
* xorg-x11-drv-cirrus-1.5.1-3.fc18.x86_64
* xorg-x11-proto-devel-7.6-24.fc18.noarch
* xorg-x11-server-Xdmx-1.13.0-11.fc18.x86_64
* xorg-x11-drv-savage-2.3.6-3.fc18.x86_64
* xorg-x11-drv-qxl-0.0.22-5.20120718gitde6620788.fc18.x86_64
* xorg-x11-xinit-session-1.3.2-7.fc18.x86_64
* xorg-x11-server-Xnest-1.13.0-11.fc18.x86_64
* xorg-x11-fonts-misc-7.5-6.fc18.noarch
* xorg-x11-drv-mach64-6.9.3-6.fc18.x86_64
* xorg-x11-server-source-1.13.0-11.fc18.noarch
* xorg-x11-twm-1.0.7-3.fc18.x86_64
* xorg-x11-resutils-7.5-4.fc18.x86_64
* xorg-x11-xsm-1.0.2-20.fc18.x86_64
* xorg-x11-fonts-ISO8859-2-100dpi-7.5-6.fc18.noarch
* xorg-x11-xauth-1.0.7-2.fc18.x86_64
* xorg-x11-drv-ati-7.0.0-0.6.20120910git7c7f27756.fc18.x86_64
* xorg-x11-drv-siliconmotion-1.7.7-2.fc18.x86_64
* xorg-x11-drv-s3virge-1.10.6-2.fc18.x86_64
* xorg-x11-drv-nouveau-1.0.3-1.fc18.x86_64
* xorg-x11-drv-tdfx-1.4.5-2.fc18.x86_64
* xorg-x11-server-common-1.13.0-11.fc18.x86_64
* xorg-x11-server-Xephyr-1.13.0-11.fc18.x86_64
* xorg-x11-drv-intel-devel-2.20.14-1.fc18.x86_64
* xorg-x11-fonts-ISO8859-1-75dpi-7.5-6.fc18.noarch
* xorg-x11-fonts-ISO8859-9-75dpi-7.5-6.fc18.noarch
* xorg-x11-drv-rendition-4.2.5-2.fc18.x86_64
* xorg-x11-drv-intel-2.20.14-1.fc18.x86_64
* xorg-x11-drv-glint-1.2.8-2.fc18.x86_64
* xorg-x11-xfwp-1.0.2-3.fc18.x86_64
* xorg-x11-drv-i740-1.3.4-2.fc18.x86_64
* xorg-x11-drv-sis-0.10.7-2.fc18.x86_64
* xorg-x11-drv-mga-1.6.1-2.fc18.x86_64
* xorg-x11-util-macros-1.17-2.fc18.noarch
* xorg-x11-drv-openchrome-devel-0.3.1-1.fc18.x86_64
* xorg-x11-fonts-75dpi-7.5-6.fc18.noarch
* xorg-x11-xfs-1.1.2-2.fc18.x86_64
* xorg-x11-fonts-ethiopic-7.5-6.fc18.noarch
* xorg-x11-drv-fbdev-0.4.3-3.fc18.x86_64
* xorg-x11-drv-r128-6.9.1-1.fc18.x86_64
* xorg-x11-drv-wacom-0.16.1-2.fc18.x86_64
* xorg-x11-xbitmaps-1.1.1-4.fc18.noarch
* xorg-x11-xkb-extras-7.7-4.fc18.x86_64
* xorg-x11-drv-dummy-0.3.6-2.fc18.x86_64
* xorg-x11-font-utils-7.5-9.fc18.x86_64
* xorg-x11-drv-openchrome-0.3.1-1.fc18.x86_64
* xorg-x11-xdm-1.1.11-4.fc18.x86_64
* xorg-x11-xfs-utils-1.1.2-2.fc18.x86_64
* xorg-x11-fonts-ISO8859-15-100dpi-7.5-6.fc18.noarch
* xorg-x11-fonts-cyrillic-7.5-6.fc18.noarch
* xorg-x11-drv-evdev-devel-2.7.3-2.fc18.x86_64
* xorg-x11-drv-synaptics-1.6.2-7.fc18.x86_64
* xorg-x11-utils-7.5-7.fc18.x86_64
* xorg-x11-drv-void-1.4.0-12.fc18.x86_64
* xorg-x11-xtrans-devel-1.2.7-2.fc18.noarch
* xorg-x11-drv-v4l-0.2.0-23.fc18.x86_64
* xorg-x11-server-utils-7.5-14.fc18.x86_64
* xorg-x11-server-Xvfb-1.13.0-11.fc18.x86_64
* xorg-x11-fonts-100dpi-7.5-6.fc18.noarch
* xorg-x11-fonts-ISO8859-2-75dpi-7.5-6.fc18.noarch
* xorg-x11-drv-ast-0.97.0-2.fc18.x86_64
* xorg-x11-drv-i128-1.3.6-2.fc18.x86_64
* xorg-x11-apps-7.6-6.fc18.x86_64
* xorg-x11-drv-ivtv-1.2.0-0.1.fc18.x86_64
* xorg-x11-fonts-ISO8859-14-75dpi-7.5-6.fc18.noarch
* xorg-x11-drv-voodoo-1.2.5-2.fc18.x86_64
* xorg-x11-drv-modesetting-0.4.0-4.fc18.x86_64
* xorg-x11-xkb-utils-7.7-4.fc18.x86_64
* xorg-x11-xkb-utils-devel-7.7-4.fc18.x86_64
* xorg-x11-fonts-ISO8859-1-100dpi-7.5-6.fc18.noarch
* xorg-x11-drv-apm-1.2.5-2.fc18.x86_64
* xorg-x11-drv-sisusb-0.9.6-2.fc18.x86_64
* xorg-x11-drv-trident-1.3.6-2.fc18.x86_64
* xorg-x11-xinit-1.3.2-7.fc18.x86_64
* xorg-x11-fonts-ISO8859-14-100dpi-7.5-6.fc18.noarch
* xorg-x11-drv-vesa-2.3.2-2.fc18.x86_64
* xorg-x11-drv-mouse-1.8.1-3.fc18.x86_64
* xorg-x11-server-Xorg-1.13.0-11.fc18.x86_64
* xorg-x11-drv-wacom-devel-0.16.1-2.fc18.x86_64
* xorg-x11-fonts-ISO8859-15-75dpi-7.5-6.fc18.noarch
* xorg-x11-drv-synaptics-devel-1.6.2-7.fc18.x86_64



to build FGLRX with this running version of X11 and devtoolset-2
<br>
scl enable devtoolset-2 bash
<br>
./ati-install 15.302 --install --force



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


