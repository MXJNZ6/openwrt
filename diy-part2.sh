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

# 修改openwrt登陆地址,把下面的192.168.2.22修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.2.22/g' package/base-files/files/bin/config_generate

#Cancel the default theme
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改主机名字，把Unicorn修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='Unicorn'' package/lean/default-settings/files/zzz-default-settings

# 修改 Edge 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings

# 晶晨宝盒
sed -i "s|https://github.com/breakings/OpenWrt|https://github.com/MXJNZ6/Flippy-D|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|s905d|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|.img.gz|待定|g" package/luci-app-amlogic/root/etc/config/amlogic

# 注视dockerd版本验证
sed -i 's/^\s*$[(]call\sEnsureVendoredVersion/#&/' feeds/packages/utils/dockerd/Makefile
