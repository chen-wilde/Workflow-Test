#!/bin/bash
#
# https://github.com/chen-wilde/Actions-OpenWrt
#
# File name: remote.sh
# Description: OpenWrt script for create remote config (Before diy script part 2)
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

mkdir -p files/etc/{config,cloudflared}
cd files/etc/config

cat > tailscale << EOF

config tailscale 'settings'
    option enabled '1'
    option fw_mode 'iptables'
    option port '41641'
    option config_path '/etc/tailscale'
    option state_file '/etc/tailscale/tailscaled.state'
    option log_stdout '1'
    option log_stderr '1'
    option acceptRoutes '0'
    option acceptDNS '1'
    option advertiseExitNode '0'
    list access 'tsfwlan'
    list access 'tsfwwan'
    list access 'lanfwts'
    list flags '--auth-key=$auth_key'
EOF

echo "$FRPC_CONFIG" > frpc
echo "$TUNNEL_CONFIG" > cloudflared
echo "$TUNNEL_CERT" > files/etc/cloudflared/cert.pem
echo "$ZEROTIER_CONFIG" > zerotier

sed -i "s/\\\$1\\\$[^:]*:0:/$LEDE_PASSWD/g" package/lean/default-settings/files/zzz-default-settings