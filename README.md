# OpenWrt-DI
 
```
1、Fork本仓库，在仓库Settings
                      -Actions
                        -General的
最下边选择Read and write permissions和Allow GitHub Actions to create and approve pull requests
2、Config Generation.yml是config在线生成流程，需要启动时设置ssh为true。
3、Delete-older-releases-artifacts.yml是删除旧的工作流程和releases。
4、OpenWrt.yml是云编译工作流程。
5、update-checker.yml是更新检测流程。
6、如果需要tg推送则需要在本仓库的
Settings
  -Secrets
     -Actions
添加TELEGRAM_CHAT_ID和TELEGRAM_BOT_TOKEN变量，内容分别为你tg的id和机器人的token  
```
```
编译大概基本流程：
1.安装编译环境
2.拉取源码
3.更新feeds
4.拉取自定义插件
5.安装feeds
6.选择插件
7.下载dl包
8.开始编译
```
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
