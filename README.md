
* update 01-30-2020 
# NOT STABLE for monitoring of AP with rtl8821ce or rtl8812au posted to fix (again to run both drivers patched in userspace of 4.18.0 and or 5.2 , 5.4)

 ```
  sudo -i
  cd /usr/src/kernels/4.18.0-penguin-expSEHDsec.trkpa/drivers/net/wireless/realtek/rtl8821ce/
  make -j16
  make install
  modprobe 8821ce
```

```sudo -i
cd /usr/src/kernels/4.18.0-penguin-expSEHDsec.trkpa/drivers/net/wireless/realtek/rtl8xxxu-mod
make -j16
make install
modprobe 8812au
```
<br>
as a supposed? ifconfig wlp0s20f0u2 mode monitor          < for 8812au (88XXau)

<br>
* update 01-29-2020
<br>
* install kernel-devel kernel-headers kernel as usual        DEBS soon
<br>
* for 8821ce
<br>
ELAN trackpad support (hp dw0045nr->hp dw0037nr)
<br>
https://drive.google.com/file/d/15m8Crgy_b5WmqVOBD8ihHADe6rMGSE-N/view?usp=sharing
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<br>
/etc/modprobe.d/kvm.conf
<br>
options kvm_intel nested=1
<br>
options kvm ignore_msrs=1
<br>
options vfio_iommu_type1 allow_unsafe_interrupts=1
<br>
options kvm_intel emulate_invalid_guest_state=0
<br>
<br>
<br>
<br>

<br>
after rhgb....
<br>
/etc/default/grub
<br>
<br>
iommu=pt vga=0x37f  intel_iommu=on cgroup_enable=memory,namespace systemd.unified_cgroup_hierarchy=0 pcie_acs_override=downstream
<br>

# * WIP

* todo patch for privledge esclation protection
* https://googleprojectzero.blogspot.com/2018/09/a-cache-invalidation-bug-in-linux.html
* for 4.14~ similar to dirty.c root esclation patching for protection

* 10-02-2019

* WIP continues to incorporate both drivers into 4.18-expSEHDsec kernel

<br>
<br>
<br>
<br>
<br>


<br>
rtl8821ce added 
<br>
* with support for monitor mode (airodump-ng, wifite) working with managed mode
<br>
rtl8821ce.tar.exp-monitor.mode.tar.gz 
<br>
RTL88XXau added 
<br>
RTL88XXau.tar.gz
<br>
<br>
<br>
(* note regarding wifite for kali users ongoing problem between wifite versions, without enabling monitor mode beforehand wifite can lead to major problems in terms of stability)

```
iwconfig wlo1 mode monitor       #where wlo1 is the wifi 
```
<br>
<br>
<br>
<br>
<br>


* 09-16-2019
* SSD support
* partial XFS support
* Intel 620/630 HD gfx (stability for framebuffer / gfx acceleration)
* xpad ONE
* KVM functional (pci-e passthrough untested)

* overlooked .config file settings for default "docker" kernel, building IP_NAT etc.
* basic docker functionality (*wip docker loading)



# * Docker Server Version: 19.03.5 -> 4.18.0

* /etc/default/grub

* add after rhgb :

* (vga mode -> 1366x768 hp-dw0045nr)

* ```rhgb vga=0x37F intel_iommu=on iommu=pt cgroup_enable=memory,namespace systemd.unified_cgroup_hierarchy=0"```

* overlay2 storage drivers here -> /etc/docker/docker.json 
```
 {
   "storage-driver": "overlay2"
 }
```
* docker.service must exist as -> ```/etc/systemd/system/multi-user.target.wants/docker.service```

```systemctl enable --now docker``` for docker always enabled at startup (optional)


* /etc/systemd/system/multi-user.target.wants/docker.service

 
* change from : 
* ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

* to:
* ExecStart=/usr/bin/dockerd --storage-driver=overlay2


# * /etc/fstab

* for /etc/default/grub config -> cgroup -> grub.cfg

```# cgroup /sys/fs/cgroup cgroup defaults

cgroup2 /sys/fs/cgroup cgroup2 defaults,blkio,net_cls,freezer,devices,cpuacct,cpu,cpuset,memory,clone_children 0 0
```
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

* conflicts between incorporating both rtl8821ce and rtl8812au into current running kernel based on design of custom header files between modules, both modules calling a few different rtl88XX models using different addressing based between similar headers

* see wifi-4.14.tar.gz in this repo
https://github.com/c4pt000/kernel-4.4.167expSEHDsec/blob/master/wifi-4.14.tar.gz

* rtl8821ce for hp dw0045nr model laptops by default (wifi)
* rtl8812au (rtl88XXau) Alfa 802.11ac support


-> todo: elan based touchpad enable functionality

* amd untested

* for nvidia gfx support via
http://us.download.nvidia.com/XFree86/Linux-x86_64/430.50/NVIDIA-Linux-x86_64-430.50.run

* intel gvt virtualization enabled > 4.16

(virtual intel graphics device *pci-e passthrough "kvm/xen")
see config CONFIG_DRM_I915_GVT=y
https://wiki.archlinux.org/index.php/Intel_GVT-g
<br>
<br>
<br>
<br>
<br>
<br>

# * updated 11-09-2019 -> fedora 31 (CentOS 8 repos still need to catch up)
<br>
<br>
rtl8821ce 
rtl8812au 
seperate builds here
not bundled conflict between rtl8821ce + rtl8812au
4.18 xfs is buggy don't rely on xfs -> ext4 over xfs

todo -> trackpad support (hp dw0037nr) (hp dw0045nr) 
# * penguin logo 4.18 expSEHDsec

* ssd support

* RPMs

https://drive.google.com/file/d/1n7xNrGHENFmX66MqK4TCf1VkAlvrrmeZ/view?usp=sharing


* DEBs

https://drive.google.com/file/d/1aKDApBHkB0__uPo4vUnR9Izz9e9k361M/view









<br>
<br>
<br>
<br>
<br>
<br>


# ** 09-2019 kernel-5.2.14-expSEHDsec removed 
* major xfs corruption bug in xfs_module discovered for xfs filesystems
https://bugzilla.redhat.com/show_bug.cgi?id=1691634#c4



# *** PUSH for uvc video support, 05-01-2019, for usb webcam support , what security kernel isnt complete without support for usb video?



* moon logo <p align="center"><img src="https://i.imgur.com/CAywHCC.png" width="80"></p>


(logo pulled from ios7 theme used with "clover bootloader" for booting ext4 drives)


* penguin logo <p align="center"><img src="https://i.imgur.com/mlFQ4sC.png" width="80"></p>



* penguin logo boot <p align="center"><img src="https://i.imgur.com/IdbMjql.jpg" width="400"></p>


# * update support for loading 88XXau module for USB wifi (Alfa usb wifi wardriving cards) "Alfa AWUS036AC"

<br>

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
https://drive.google.com/file/d/1iNiEFi4n0lUBYyMIYLyPMhHi9YN99dOf/view?usp=sharing
<br>
DEBs
<br>
https://drive.google.com/file/d/1hIVXw5cyy_eEF7r7T5xr7XpbFB9bJmbz/view?usp=sharing
<br>
<br>
<br>

modprobe uvcvideo
<br>
modprobe hid_xpadneo
<br>
*updated for the moon logo
<br>
modprobe 88XXau
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


# * new 88XXau module support (moonLogo, working for .debs, still need to throughly check threw the 88XXau module loading for the penguin .debs)
<br>
RPMs
<br>
https://drive.google.com/uc?id=143gCFTmYXbn0yU7p5LxWQXQxlYiLNnJt&export=download
<br>
DEBs
<br>
https://drive.google.com/file/d/18ysoII0cm8A2oUojNsUNcj_0ICvUMdo1/view
<br>
<br>
modprobe uvcvideo
<br>
modprobe hid_xpadneo
<br>
modprobe 88XXau
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

donate via google pay

bc1q7ap44v0e8tz506fqvdygd7zztluvrl73pd527q

or 

if you found this useful,

https://www.binance.com/userCenter/deposit.html      << for bitcoin mc/visa





