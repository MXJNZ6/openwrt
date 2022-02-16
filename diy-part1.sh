#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

#readd cpufreq for aarch64
#sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
#sed -i 's/services/system/g'  package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
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
