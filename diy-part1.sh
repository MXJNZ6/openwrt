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

# 添加源
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
sed -i '$a src-git xiaorouji https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall;luci' feeds.conf.default

# 修改openwrt登陆地址,把下面的192.168.2.22修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.2.22/g' package/base-files/files/bin/config_generate

# 修改主机名字，把Unicorn修改你喜欢的就行（不能纯数字或者使用中文）
sed -i "/uci commit system/i\uci set system.@system[0].hostname='Unicorn'" package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='Unicorn'/g" ./package/base-files/files/bin/config_generate

#svn co https://github.com/Leo-Jo-My/luci-theme-opentomato/trunk package/luci-theme-opentomato
#svn co https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy package/luci-theme-rosy
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
#svn co https://github.com/vernesong/OpenClash/branches/dev/luci-app-openclash package/luci-app-openclash
svn co https://github.com/linkease/nas-packages/trunk/network/services/ddnsto package/ddnsto
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto package/luci-app-ddnsto
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/luci-app-aliyundrive-webdav
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/luci-app-filebrowser
#svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-ipsec-server package/luci-app-ipsec-server
#svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-fileassistant package/luci-app-fileassistant
#svn co https://github.com/Lienol/openwrt-luci/trunk/applications/luci-app-openvpn package/luci-app-openvpn
#svn co https://github.com/Lienol/openwrt-packages/branches/main/net/openvpn-easy-rsa package/openvpn-easy-rsa
#svn co https://github.com/Lienol/openwrt-package/branches//new-openvpn-luci/luci-app-openvpn-client package/luci-app-openvpn-client
#svn co https://github.com/Lienol/openwrt-package/branches//new-openvpn-luci/luci-app-openvpn-server package/luci-app-openvpn-server
#svn co https://github.com/kenzok8/small-package/trunk/luci-app-openvpn-server package/luci-app-openvpn-server
#svn co https://github.com/kenzok8/small-package/trunk/openvpn-easy-rsa-whisky package/openvpn-easy-rsa-whisky
#svn co https://github.com/Lienol/openwrt-luci/trunk/applications package/ocserv
#mv package/ocserv/luci-app-ocserv package
#rm -rf package/ocserv

#git clone https://github.com/frainzy1477/luci-app-clash.git package/luci-app-clash
#git clone https://github.com/chenhw2/luci-app-aliddns.git package/luci-app-aliddns
git clone https://github.com/jerrykuku/luci-app-vssr.git  package/luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
#git clone https://github.com/lisaac/luci-app-dockerman package/luci-app-dockerman
git clone https://github.com/zxlhhyccc/luci-app-v2raya package/luci-app-v2raya
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone https://github.com/honwen/luci-app-xray.git package/luci-app-xray
# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/luci-app-xray/tools/po2lmo
make && sudo make install
popd

# Update feeds
./scripts/feeds update -a

# 删除重复包
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/packages/multimedia//aliyundrive-webdav
#rm -rf feeds/packages/net/openvpn-easy-rsa
#rm -rf feeds/luci/applications/luci-app-ocserv
#rm -rf feeds/luci/applications/luci-app-openvpn
#mv package/luci-app-openvpn feeds/luci/applications
#mv package/openvpn-easy-rsa feeds/packages/net
#mv package/luci-app-ocserv feeds/luci/applications
#rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/packages/multimedia/UnblockNeteaseMusic
rm -rf feeds/luci/applications/luci-app-unblockmusic
#rm -rf feeds/luci/applications/luci-app-openvpn-server
rm -rf feeds/packages/multimedia/UnblockNeteaseMusic-Go
rm -rf feeds/luci/applications/luci-app-aliyundrive-webdav

# Install feeds
./scripts/feeds install -a
