sed -i 's/4000000>/7280000>/' target/linux/mediatek/dts/mt7981b-h3c-magic-nx30-pro.dts package/boot/uboot-mediatek/patches/435-add-h3c_magic-nx30-pro.patch

mkdir -p files/etc/{config,cloudflared}
echo "$WIRELESS_CONF" > files/etc/config/wireless
echo "$TUNNEL_CERT" > files/etc/cloudflared/cert.pem
echo "$HTTPS_FW4" > files/etc/firewall

cd feeds/packages/net
sed -i "s/enabled '0'/enabled '1'/" banip/files/banip.conf
sed -i "s/enabled '0'/enabled '1'/;s/token ''/token '$TUN30P_TOKEN'/" cloudflared/files/cloudflared.config

echo "$ACME_CONF" > acme-common/files/acme.config
echo "$DDNS_CONF" > ddns-scripts/files/etc/config/ddns

cd ../../../package
sed -i "s/uhttpd.crt/$DOMAIN.fullchain.crt/;s/uhttpd.key/$DOMAIN.key/" network/services/uhttpd/files/uhttpd.config
sed -i '/-s "$UHTTPD_CERT"/,/}/d' network/services/uhttpd/files/uhttpd.init

cd base-files/files
sed -i 's/-dhcp/-pppoe/' lib/functions/uci-defaults.sh
sed -i "s/'username'/'$PPPOE_USER'/;s/'password'/'006688'/" bin/config_generate
sed -i "s/::0/$PASSWD/" etc/shadow