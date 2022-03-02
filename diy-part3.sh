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
sed -i 's/luci-theme-bootstrap/luci-theme-opentomato/g' feeds/luci/collections/luci/Makefile

# 注释dockerd版本验证
#sed -i 's/^\s*$[(]call\sEnsureVendoredVersion/#&/' feeds/packages/utils/dockerd/Makefile

# luci-app-openvpn
sed -i 's/services/vpn/g'  feeds/luci/applications/luci-app-openvpn/luasrc/controller/openvpn.lua
sed -i 's/services/vpn/g'  feeds/luci/applications/luci-app-openvpn/luasrc/model/cbi/openvpn.lua
sed -i 's/services/vpn/g'  feeds/luci/applications/luci-app-openvpn/luasrc/view/openvpn/pageswitch.htm
sed -i 's/^#~ \(.*msgid\)/\1/' feeds/luci/applications/luci-app-openvpn/po/zh-cn/openvpn.po
sed -i 's/^#~ \(.*msgstr\)/\1/' feeds/luci/applications/luci-app-openvpn/po/zh-cn/openvpn.po
sed -i '/msgid "Cryptography"/i\msgid "« Switch to advanced configuration »"' feeds/luci/applications/luci-app-openvpn/po/zh-cn/openvpn.po
sed -i '/msgid "Cryptography"/i\msgstr "« 切换到高级配置"' feeds/luci/applications/luci-app-openvpn/po/zh-cn/openvpn.po
sed -i '/msgid "Cryptography"/{x;p;x;}' feeds/luci/applications/luci-app-openvpn/po/zh-cn/openvpn.po

# luci-app-argon-config
sed -i 's/system/services/g'  package/luci-app-argon-config/luasrc/controller/argon-config.lua

# 晶晨宝盒
sed -i "s|https://github.com/breakings/OpenWrt|https://github.com/MXJNZ6/Flippy-D|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|s905d|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|opt/kernel|kernel|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|.img.gz|待定|g" package/luci-app-amlogic/root/etc/config/amlogic
