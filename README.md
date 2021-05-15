* 05-14-2021

wip** fingerprint support VFS495 fingerprint usb module
<br>
https://github.com/c4pt000/Validity-sensors-fprint-demo-fingerprint-gui-biometric-fedora
<br>

wip** xscreensaver fingerprint support
<br>
https://github.com/c4pt000/xscreensaver-fingerprint-atomic
<br>

* for HAXM 05-13-2021
<br>

https://github.com/c4pt000/kernel-5.11.6-expSEHDsec-HAXM-cgroup-virtio/releases/tag/haxm-experimental
<br>
https://github.com/c4pt000/haxm
<br>

https://raw.githubusercontent.com/c4pt000/kernel-5.11.6-expSEHDsec-HAXM-cgroup-virtio/master/config-5.11.6-HAXM-expSEHDsec-c4pt000
<br>
```
modprobe haxm
```
```
for macOS bigSur vt-x
https://raw.githubusercontent.com/c4pt000/kernel-5.11.6-expSEHDsec-HAXM-cgroup-virtio/master/macOS-bigSur.xml-VT-X-adjust-accordingly.xml
https://github.com/c4pt000/kernel-5.11.6-expSEHDsec-HAXM-cgroup-virtio/raw/master/OPENCORE.img.tar.gz

https://raw.githubusercontent.com/c4pt000/OSX-KVM/master/fetch-macOS.py


requires /etc/default/grub similar

iommu=pt intel_iommu=on UUIDHERE rd.lvm-here-etc end of line -> rhgb vga=792 rd.driver.blacklist=nouveau vfio pci.ids=8086:yourid pcie_acs_override=downstream,multifunction"



cat /etc/modprobe.d/kvm.conf 
###
### This configuration file was provided by the qemu package.
### Feel free to update as needed.
###

###
### Set these options to enable nested virtualization
###


options kvm ignore_msrs=y
options kvm_intel nested=1

#options kvm_amd nested=1

options vfio_iommu_type1 allow_unsafe_interrupts=1


```
changes to /etc/modprobe.d/kvm.conf
```
mkinitrd /boot/initramfs-5.11.6-HAXM-expSEHDsec-c4pt000.img 5.11.6-HAXM-expSEHDsec-c4pt000 --force
```
# disabling kvm_intel nested=1 will disable running docker inside of docker

![s1](https://raw.githubusercontent.com/c4pt000/kernel-5.11.6-expSEHDsec-HAXM-cgroup-virtio/master/nested-KVM-android-sdk.png)
```
yum install virt-manager qemu ovmf etc

https://github.com/c4pt000/OSX-KVM

Fetch macOS installer.

./fetch-macOS-v2.py
ATTENTION: Installing Big Sur is NOT recommended at this time, unless you are a Hackintosh developer! Let the Big Sur setup sit at the Country Selection screen and other similar places for a while ;)

You can choose your desired macOS version here. After executing this step, you should have the BaseSystem.dmg file in the current folder.

Sample run:

$ ./fetch-macOS-v2.py
1. High Sierra (10.13)
2. Mojave (10.14)
3. Catalina (10.15) - RECOMMENDED
4. Latest (Big Sur - 11)

Choose a product to download (1-4): 3
Note: Modern NVIDIA GPUs are supported on HighSierra but not on later versions.

Convert the downloaded BaseSystem.dmg file into the BaseSystem.img file.

qemu-img convert BaseSystem.dmg -O raw BaseSystem.img
Create a virtual HDD image where macOS will be installed. If you change the name of the disk image from mac_hdd.img to something else, the boot scripts will need to be updated to point to the new image name.

qemu-img create -f qcow2 mac_hdd_ng.img 128G
```

# HAXM macOS bigSur qemu-kvm
```
from terminal

spctl --master-disable
```
"details"
![s1](https://raw.githubusercontent.com/c4pt000/kernel-5.11.6-expSEHDsec-HAXM-cgroup-virtio/master/apple-system-pref.png)
![s1](https://raw.githubusercontent.com/c4pt000/kernel-5.11.6-expSEHDsec-HAXM-cgroup-virtio/master/details-system-pref.png)
![s1](https://raw.githubusercontent.com/c4pt000/kernel-5.11.6-expSEHDsec-HAXM-cgroup-virtio/master/restart-HAXM-system-pref.png)




![s1](https://raw.githubusercontent.com/c4pt000/haxm/master/HAXM-virt-make-menu.png)
![s1](https://raw.githubusercontent.com/c4pt000/haxm/master/HAXM-virt-make-menu-info.png)

```

sed -i 's/GRUB_ENABLE_BLSCFG=true/GRUB_ENABLE_BLSCFG=false/g' /etc/default/grub 

sleep 2s
grub2-editenv create
rpm -e --nodeps kernel-core kernel-modules kernel-headers kernel-devel kernel-srpm-macros kernel

rpm -Uvh kernel-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
rpm -Uvh kernel-headers-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
rpm -Uvh kernel-devel_5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm 


grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
grub2-mkconfig -o /boot/grub2/grub.cfg


```

for iwlwifi
```
yum reinstall iwl*-firmware
cd /usr/lib/firmware
unxz iwlwifi-*.xz
cd /usr/lib
cp -rf firmware /lib/
rmmod -f iwlwifi
modprobe iwlwifi

or
reboot
```


# current kernel recommended to build inside of docker containers for most projects whether they are c++ projects or based on other languages due to newer security functions enabled with spinlocks, mutex, stack hardening, and other glibc compiler protection it is recommened to build in docker guest environments for isolated builds to build the code seperate from the host by using working data directories to a docker guest, see the following :

* docker for graphical IDEs, use:
```
-----------------------------------------
-v /sys/fs/cgroup:/sys/fs/cgroup:ro -e "DISPLAY=${DISPLAY:-:0.0}" -v /tmp/.X11-unix:/tmp/.X11-unix
```
* for docker directories linked from the host use:
```
 -v    host    :      guest
--------------------------------------------------
-v /opt/your-dir:/opt/another-dir 
```
* use caution when having to run docker guest environments as --privileged with /usr/sbin/init for docker guests that are capables of running full fledged docker guest also (docker running inside of docker or "nested" docker)

* update 04-24-2021


* note had a problem with MUTEX had to change MUTEX debug flags to recompile NVIDIA-Linux-x86_64-460.56.run for current updated running kernel
* this version still seems working as it did with 5.11.6 (Even though this is the same base and not a kernel subversion up 

# releases RPMs
# https://github.com/c4pt000/kernel-5.11.6-expSEHDsec/releases/tag/5.11.6-expSEHDsec

for the complete changes to the current .config 
https://raw.githubusercontent.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/master/config-5.11.6-expSEHDsec-cgroupvirtio

also changed build from source script
https://raw.githubusercontent.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/master/build-kernel.sh

* CHANGES/updates added more support for cgroups and virtio drivers by enabling flags, changed tick functions slightly  https://www.kernel.org/doc/Documentation/cgroup-v1/blkio-controller.txt for improved docker support with experimental docker nested inside of docker nested VMs on the same host for other experimentation 

# nested docker for running docker inside of docker on the same host
```
docker run -it --privileged -d  c4pt/fedora:34 /usr/sbin/init
```

<br>
CONFIG_BLK_CGROUP_IOLATENCY=y
<br>
CONFIG_BLK_CGROUP_IOCOST=y
<br>

# SYSTEM SPLASH doesnt account for all cores in a system my system is 24 cores but the loading penguin splash only shows 18 cores, htop reveals how many cores total your system has, your amount of cores will vary based on system,   less than 16 cores is visible in the penguin splash as accurate core count more than 12 or 16 cores depending on core count will not display with loading splash screen

![s1](https://raw.githubusercontent.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/master/24-cores-even-though-splash-shows-less.png)



also disabled onboard PC speaker module,
<br>
(an attempt to silence the terminal bell without a gui instead of setting a .bashrc bell-type disable 
<br>

```

CONFIG_INIT_ON_FREE_DEFAULT_ON:                                                                               
                                                                                                                
   This has the effect of setting "init_on_free=1" on the kernel                                                
   command line. This can be disabled with "init_on_free=0".           


CONFIG_INIT_ON_ALLOC_DEFAULT_ON:                                                                                                                                                                                                                                        
   This has the effect of setting "init_on_alloc=1" on the kernel                                    
   command line. This can be disabled with "init_on_alloc=0".                                       
   When "init_on_alloc" is enabled, all page allocator and slab   


  |*| Enable memcg SLUB sysfs support by default                                                                
  |*| Disable heap randomization     
  |*|   ACRN Guest support                                                                           

 TSX is enabled on TSX capable HW that is believed to be safe against                               
   side channel attacks- equals the tsx=auto command line parameter.  

  |*| Software Guard eXtensions (SGX)                                                               
  |*| Disable the 32-bit vDSO (needed for glibc 2.3.3)                                             

CONFIG_COMPAT_VDSO=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_VDSO_TIME_NS=y

CONFIG_LEGACY_VSYSCALL_XONLY:                                                                                                                                                                                                                                         
   The kernel traps and emulates calls into the fixed vsyscall                                    
   address mapping and does not allow reads.  This                                                                                                        
   configuration is recommended when userspace might use the                                                                                              
   legacy vsyscall area but support for legacy binary                                                                                                     
   instrumentation of legacy code is not needed.  It mitigates                                                                                            
  certain uses of the vsyscall area as an ASLR-bypassing                                                                                                 
   buffer.                                   



 |*|   Timer events oriented (TEO) governor (for tickless systems)                                            
 |*|   Haltpoll governor (for virtualized systems)   

 [ ] Enable core dump support  <- disabled for security 
 
 CONFIG_HWPOISON_INJECT is not set <- same here

 


CONFIG_Z3FOLD:                                                                                                                                         
                                                                                                                                                    
   A special purpose allocator for storing compressed pages.                                                                                         
   It is designed to store up to three compressed pages per physical                                                                                 
   page. It is a ZBUD derivative so the simplicity and determinism are                                                                               
   still there.  



  |*|   Enable the compressed cache for swap pages by default                                                   





 CONFIG_CMA:                                                                                                   
                                                                                                              
   This enables the Contiguous Memory Allocator which allows other                                           
   subsystems to allocate big physically-contiguous blocks of memory.                                                                                     
   CMA reserves a region of memory and allows only movable pages to                                                                                       
   be allocated from it. This way, the kernel can use the memory for                                                                                      
   pagecache and when a subsystem requests for contiguous area, the                                                                                       
   allocated pages are migrated away to serve the contiguous request.         



|*|   XFS Realtime subvolume support                                                                         
|*|   XFS online metadata check support                                                                      
|*|     XFS online metadata repair support                                                                   
|*]   XFS Verbose Warnings      



 <M>   Virtio Filesystem                                                                                     
 |*|     Virtio Filesystem Direct Host Memory Access support (NEW)         





 <M>   VirtualBox guest shared folder (vboxsf) support                                                         


# more font support

  |*| Select compiled-in fonts                                                                                 
  |*|   VGA 8x8 font                                                                                          
  -*-   VGA 8x16 font                                                                                          
  |*|   Mac console 6x11 font (not supported by all drivers)                                                  
  |*|   console 7x14 font (not supported by all drivers)                                                       
  |*|   Pearl (old m68k) console 8x8 font                                                                     
  |*|   Acorn console 8x8 font                                                                                
  |*|   Mini 4x6 font                                                                                          
  |*|   Medium-size 6x10 font                                                                                  
  |*|   console 10x18 font (not supported by all drivers)                                                      
  |*| Sparc console 8x16 font                                                                                  
  |*| Sparc console 12x22 font (not supported by all drivers)                                                 
  |*| Terminus 16x32 font (not supported by all drivers)                                                       
  |*| OLED 6x8 font        


```


CONFIG_PRINTK_TIME:                                                                                                                                    
                                                                                                                                                         
  Selecting this option causes time stamps of the printk()                                                                                               
  messages to be added to the output of the syslog() system                                                                                              
  call and at the console.                                                                                                                               
                                                                                                                                                        
  The timestamp is always recorded internally, and exported                                                                                              
  to /dev/kmsg. This flag just specifies if the timestamp should                                                                                         
  be included, not that the timestamp is recorded.   

   disable of printk->syslog to /etc/default/grub option
                                                                                                                                                       
   The behavior is also controlled by the kernel command line                                                                                             
   parameter printk.time=1. See


  |*| Lock debugging: prove locking correctness                                                                 
  |*|   Enable raw_spinlock - spinlock nesting checks  





 CONFIG_RT_MUTEXES=y
 CONFIG_MUTEX_SPIN_ON_OWNER=y

 CONFIG_DEBUG_RT_MUTEXES is not set
 CONFIG_DEBUG_MUTEXES is not set
 CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
 CONFIG_WW_MUTEX_SELFTEST is not set


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


# SOURCE build based on 5.11.6 with .config changes for expSEHDsec penguin_logo, hid-xpadneo joystick module
```
(or docker run -it -d fedora:33)
mkdir -p /opt/kernel-build
cd /opt/kernel-build
yum install wget -y
wget https://raw.githubusercontent.com/c4pt000/kernel-5.11.0-expSEHDsec/master/build-kernel.sh
source build-kernel.sh
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

* RPMs from now on only debian/ubuntu/kali users should use the packages 'dpkg and alien to convert RPMs to DEBs on their systems'
```
alien --scripts *.rpm
```
<br>
03-14-2021
<br>
* CVE-2021-27365: heap buffer overflow (Local Privilege Escalation, Information Leak, Denial of Service)
<br>
* CVE-2021-27363: kernel pointer leak (Information Leak)
<br>
* CVE-2021-27364: out-of-bounds read (Information Leak, Denial of Service)
<br>
https://www.bleepingcomputer.com/news/security/15-year-old-linux-kernel-bugs-let-attackers-gain-root-privileges/
<br>
<br>
<br>
<br>

penguin_hfs-5.11.6_expSEHDsec+T.xen.tar.gz
<br>
https://drive.google.com/file/d/1E8UfuHtr5O-NBtQtnWE1m3lOS8uLmAbx/view?usp=sharing
<br>
All three vulnerabilities are patched as of 5.11.4, 5.10.21, 5.4.103, 4.19.179, 4.14.224, 4.9.260, and 4.4.260, and patches became available in mainline Linux kernel on March 7th. No patches will be released for EOL unsupported kernels versions like 3.x and 2.6.23.



* 03-04-2021 update penguin-expSEHDsec-5.11.0 -> (NVIDIA-Linux-x86_64-460.56.run)
* improvements for Xen, still supporting KVM + Docker
# patched for https://www.helpnetsecurity.com/2021/03/03/cve-2021-26708/ (CVE-2021-26708)

03-14-2021 link removed due to newer CVE effecting root escalation

<br>
 (CVE-2021-26708)  (CVE-2021-26708)  (CVE-2021-26708)  (CVE-2021-26708)  (CVE-2021-26708)  (CVE-2021-26708)  (CVE-2021-26708)  (CVE-2021-26708)
 <br>
* 01-09-2021 update penguin-expSEHDsec-5.9.16 -> (NVIDIA-Linux-x86_64-450.80.02.run not supported NVIDIA users use NVIDIA-Linux-x86_64-460.32.03.run) 
<br>
* 0-11-2021 improvements for Xen, still supporting KVM + Docker
<br>
link removed due to CVE discovery of VF_SOCK
<br>
<br>
<br>
<br>

 (CVE-2021-26708) (CVE-2021-26708) (CVE-2021-26708) (CVE-2021-26708) (CVE-2021-26708) (CVE-2021-26708) (CVE-2021-26708)
* 12-30-2020 update for penguin-expSEHDsec-4.18 -> added support for HFS volumes to mount read/write
removed for CVE discovery

<br>
<br>
<br>
<br>

* noticed this IRQ article this kernel 5.9.16 *does* have IRQ accounting and custom CPU TICK
https://tanelpoder.com/posts/linux-hiding-interrupt-cpu-usage/
```
cat /boot/config-5.9.16-penguin-expSEHDsec+T | grep TICK_CPU_ACC
CONFIG_TICK_CPU_ACCOUNTING=y
$ cat /boot/config-5.9.16-penguin-expSEHDsec+T | grep CONFIG_IRQ_TIME_ACCOUNTING=y 
CONFIG_IRQ_TIME_ACCOUNTING=y
```

* fixed -> 9:38am UTC no IPTABLES for docker -> KVM.,    see previous kernel for docker / kvm WIP ->>
* for centos 8 / rhel 8 red hat is moving toward nftables, best suggestion for KVM / DOCKER / libvirt networking -> disabled firewalld / disable nftables -> seek UFW for firewall or other firewall variants,
changing firewalld.conf "nftables" to "iptables" (since nftables is a newer solution for iptables as an improved iptables via RHEL bug report https://bugzilla.redhat.com/show_bug.cgi?id=1623868#c7 noticing libvirtd networking breaks in F29 and CENTOS 8 ? as discovered from my own use in the last 24 hrs notice ? CVE ? or BUG report here on libvirtd
https://bugzilla.redhat.com/show_bug.cgi?id=1623868


also within the last 8 hours accidentally disabled "NF_NAT in the kernel config by accidentally hitting a keyboard button disabling "M" to load NAT based firewall as one of many options for NAT based firewalling in the kernel
```
/etc/firewalld/firewalld.conf
------------------------
FirewallBackend=iptables                from (nftables)
```

* 01-30-2020 ->  (CVE-2021-26708)

 ```
  sudo -i
  cd /usr/src/kernels/4.18.0-penguin-expSEHDsec+T/drivers/net/wireless/realtek/rtl8821ce/
  make -j16
  make install
  modprobe 8821ce
```

```sudo -i
cd /usr/src/kernels/4.18.0-penguin-expSEHDsec+T/drivers/net/wireless/realtek/rtl8xxxu-mod
make -j16
make install
modprobe 8812au
```
<br>


<br>
<br>
<br>
<br>
<br>
* update 01-30-2020
<br>
monitor mode for interfaces fixed for "no wireless extensions" in ifconfig / iwconfig wifite + kali + kismet support etc
<br>
CONFIG_CFG80211_WEXT=y
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

or

<br>

iommu=pt vga=792 intel_iommu=on cgroup_enable=memory,namespace systemd.unified_cgroup_hierarchy=0 pcie_acs_override=downstream

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

REMOVED for  (CVE-2021-26708)









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

REMOVED for  (CVE-2021-26708)

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

REMOVED FOR  (CVE-2021-26708)

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
 security kernel, "hardware candy"




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
REMOVED for  (CVE-2021-26708)

rpms (01-07-2019- push for NBD(qemu-img), OVERLAY-FS, NFS options) *Docker support enabled

REMOVED for  (CVE-2021-26708)

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









