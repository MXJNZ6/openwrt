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

# 注释dockerd版本验证
#sed -i 's/^\s*$[(]call\sEnsureVendoredVersion/#&/' feeds/packages/utils/dockerd/Makefile

# 晶晨宝盒

sed -i "s|https://github.com/breakings/OpenWrt|https://github.com/MXJNZ6/Flippy-D|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|s905d|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|opt/kernel|kernel|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|.img.gz|待定|g" package/luci-app-amlogic/root/etc/config/amlogic