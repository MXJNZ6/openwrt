# OpenWrt-DI
 
[![Build OpenWrt](https://github.com/MXJNZ6/openwrt/actions/workflows/OpenWrt.yml/badge.svg)](https://github.com/MXJNZ6/openwrt/actions/workflows/OpenWrt.yml)
```
Target System  ->  QEMU ARM Virtual Machine 
Subtarget ->  QEMU ARMv8 Virtual Machine (cortex-a53)
Target Profile  ->  Default
Target Images  ->   tar.gz
*** 必选软件包(基础依赖包，仅保证打出的包可以写入EMMC,可以在EMMC上在线升级，不包含具体的应用)： 
Languages -> Perl               
             ->  perl-http-date
             ->  perlbase-getopt
             ->  perlbase-unicode                                  
Utilities -> Disc -> blkid、fdisk、lsblk、parted            
          -> Filesystem -> attr、btrfs-progs(Build with zstd support)、chattr、dosfstools、
                           f2fs-tools、lsattr、xfs-fsck、xfs-mkfs
          -> Compression -> bsdtar 或 p7zip(非官方源)、pigz
          -> Shells  ->  bash         
          -> gawk、getopt、losetup、tar、uuidgen

 * (可选)Wifi基础包：
 *     打出的包可支持博通SDIO无线模块,Firmware不用选，
 *     因为打包源码中已经包含了来自Armbian的firmware，
 *     会自动覆盖openwrt rootfs中已有的firmware
 Kernel modules  ->   Wireless Drivers -> kmod-brcmfmac(SDIO) 
                                       -> kmod-mac80211
 Network  ->  WirelessAPD -> wpa-cli(先选下边的才会出现)
                          -> wpad-basic
```
```
N1.yml介绍(需要在settings里填写RELEASES_TOKEN)
1. 39行为检测releases里的最新rootfs文件可自定义MXJNZ6/OpenWrt-D为自己或者其他人的编译仓库
2. 48行是内核文件下载途径
3. 49行是f大打包脚本下载途径
4. 57行为下载rootfs文件途径，修改MXJNZ6/OpenWrt-D为与39行同一仓库
5. 81行为打包命令根据设备不同可根据需求更改
6. 22-29行是几个任务流程，比如我只需要5.15那么你可以把其它的都删除，如果需要其它的可以在类比文件结构新建一个
```
```
whoami文件介绍
1. 第1行你自己可以想一个拉风的代号
2. 第2行为openwrt相关版本号
3. 第3行为linux内核版本号
4. 第4行为F大内核打包版本
5. 第5行为内核全称
6. 第6行为内核途径
7. 如f大内核更新，想编译最新版只需更改第3和第4行就行。第二行可修改与F大或者lean一致，也可修改成自己喜欢的
```