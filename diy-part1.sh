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

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
##################################################################################################
sed -i '$a src-git xiaorouji https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default

svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns                                     package/smartdns
git clone https://github.com/pymumu/luci-app-smartdns.git -b lede                                        package/luci-app-smartdns

svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome                          package/adg
svn co https://github.com/Lienol/openwrt-packages/trunk/net/adguardhome                                  package/AdGuardHome
sed -i 's/DEPENDS.*/& \+adguardhome/g'  package/adg/Makefile
