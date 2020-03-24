#!/bin/bash
# https://wiki.merproject.org/wiki/Adaptations/PinePhone64#U-Boot

echo "Building ARM Trusted Firmware (ATF)..."
cd arm-trusted-firmware
make PLAT=sun50i_a64 bl31
export BL31=../arm-trusted-firmware/build/sun50i_a64/release/bl31.bin

echo "Building U-boot for A64 with ATF"
cd ../u-boot
make clean
make pinephone_defconfig
make
