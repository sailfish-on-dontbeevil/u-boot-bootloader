#!/bin/bash
# https://wiki.merproject.org/wiki/Adaptations/PinePhone64#U-Boot

echo "Building ARM Trusted Firmware (ATF)..."
cd arm-trusted-firmware
make PLAT=sun50i_a64 bl31
M0_CROSS_COMPILE="arm-linux-gnu-" make PLAT=rk3399
export BL31=../arm-trusted-firmware/build/sun50i_a64/release/bl31.bin

echo "Building U-boot for A64 with ATF"
cd ../u-boot
make clean
make pinephone_defconfig
make pinephone-pro-rk3399_defconfig
make
