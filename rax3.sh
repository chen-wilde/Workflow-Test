sed -i 's/1.1/10.1/g' package/base-files/files/bin/config_generate
sed -i 's/\${defaults ? 0 : 1}/0/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.uc