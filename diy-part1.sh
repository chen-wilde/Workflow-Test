#!/bin/bash
#
# https://github.com/chen-wilde/Actions-OpenWrt
#
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
cat > feeds.conf.default << EOF
src-git smpackage https://github.com/kenzok8/small-package
src-git op_packages https://github.com/openwrt/packages
src-git packages https://github.com/coolsnowwolf/packages
src-git op_luci https://github.com/openwrt/luci
src-git luci https://github.com/coolsnowwolf/luci
src-git op_routing https://github.com/openwrt/routing
src-git routing https://github.com/coolsnowwolf/routing
src-git op_telephony https://github.com/openwrt/telephony
src-git telephony https://github.com/coolsnowwolf/telephony
EOF

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default