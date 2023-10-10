#!/bin/bash
rm -rf CPE830
git clone https://git.openwrt.org/openwrt/openwrt.git CPE830
rm 3133.patch
wget https://patch-diff.githubusercontent.com/raw/openwrt/openwrt/pull/3133.patch
cp config_CPE830 CPE830/.config
cd CPE830
patch -p1 < ../3133.patch
./scripts/feeds update -a
./scripts/feeds install -a
cd ..
cp config_CPE830 CPE830/.config
chown -R admin:admin CPE830
cd CPE830
sudo -u admin make defconfig
sudo -u admin make -j16 download
sudo -u admin make -j16
cd ..
gzip -9 CPE830/bin/targets/ath79/generic/openwrt-ath79-generic-yuncore_cpe830-squashfs-sysupgrade.bin
mv CPE830/bin/targets/ath79/generic/openwrt-ath79-generic-yuncore_cpe830-squashfs-sysupgrade.bin.gz WHEREYOUWANT
