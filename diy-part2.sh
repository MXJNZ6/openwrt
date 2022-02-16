#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 晶晨宝盒
sed -i "s|https://github.com/breakings/OpenWrt|https://github.com/MXJNZ6/Flippy-D|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|s905d|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|opt/kernel|kernel|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|.img.gz|待定|g" package/luci-app-amlogic/root/etc/config/amlogic

# 注释dockerd版本验证
#sed -i 's/^\s*$[(]call\sEnsureVendoredVersion/#&/' feeds/packages/utils/dockerd/Makefile

#拉取插件
#git clone https://github.com/jerrykuku/luci-app-vssr.git  package/luci-app-vssr
#git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy

rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/luci-app-filebrowser
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-fileassistant package/luci-app-fileassistant
#git clone https://github.com/frainzy1477/luci-app-clash.git package/luci-app-clash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash

rm -rf feeds/packages/net/aliyundrive-webdav
rm -rf feeds/luci/applications/luci-app-aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/luci-app-aliyundrive-webdav

git clone https://github.com/chenhw2/luci-app-aliddns.git package/luci-app-aliddns
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic

rm -rf feeds/luci/applications/luci-app-dockerman
git clone https://github.com/lisaac/luci-app-dockerman package/luci-app-dockerman

git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-ipsec-server package/luci-app-ipsec-server

rm -rf feeds/packages/multimedia/UnblockNeteaseMusic
rm -rf feeds/packages/multimedia/UnblockNeteaseMusic-Go
rm -rf feeds/luci/applications/luci-app-unblockmusic
git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

rm -rf feeds/luci/applications/luci-app-openvpn-server
svn co https://github.com/kenzok8/small-package/trunk/luci-app-openvpn-server package/luci-app-openvpn-server
svn co https://github.com/kenzok8/small-package/trunk/openvpn-easy-rsa-whisky package/openvpn-easy-rsa-whisky
