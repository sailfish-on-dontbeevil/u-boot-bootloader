#!/bin/bash
# https://wiki.merproject.org/wiki/Adaptations/PinePhone64#U-Boot

echo "Building ARM Trusted Firmware (ATF)..."
cd arm-trusted-firmware
make PLAT=sun50i_a64 bl31
make PLAT=rk3399

echo "Building U-boot for A64 with ATF"
cd ../u-boot
make clean
export BL31=../arm-trusted-firmware/build/sun50i_a64/release/bl31.bin
make pinephone_defconfig
make
export BL31=../arm-trusted-firmware/build/rk3399/release/bl31/bl31.elf
make pinephone-pro-rk3399_defconfig
make
