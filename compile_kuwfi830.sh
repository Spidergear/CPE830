#!/bin/bash
rm -rf openwrt
git clone https://git.openwrt.org/openwrt/openwrt.git openwrt
rm 3133.patch
wget https://github.com/Spidergear/CPE830/blob/master/3133.patch
cp config_ikeja openwrt/.config
cd openwrt
patch -p1 < ../3133.patch
./scripts/feeds update -a
./scripts/feeds install -a
cd ..
cp config_ikeja openwrt/.config
#chown -R admin:admin kuwfi830
cd kuwfi830
make defconfig
make -j16 download
make -j16 V=s
#cd ..
#gzip -9 kuwfi830/bin/targets/ath79/generic/openwrt-ath79-generic-yuncore_cpe830-squashfs-sysupgrade.bin
#mv kuwfi830/bin/targets/ath79/generic/openwrt-ath79-generic-yuncore_cpe830-squashfs-sysupgrade.bin.gz WHEREYOUWANT

