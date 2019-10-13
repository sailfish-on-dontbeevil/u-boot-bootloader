#!/bin/bash
# https://wiki.merproject.org/wiki/Adaptations/PinePhone64#U-Boot

echo "Building ARM Trusted Firmware (ATF)..."
cd arm-trusted-firmware
make PLAT=sun50i_a64 DEBUG=1 bl31
export BL31=./build/sun50i_a64/debug/bl31.bin

echo "Building U-boot for A64 with ATF"
make clean
make sopine_baseboard_defconfig
make
