gpio set 114

if test ${mmc_bootdev} -eq 0 ; then
	echo "Booting from SD";
	setenv bootdev 0;
else
	echo "Booting from eMMC";
	setenv bootdev 2;
fi;

echo Setting bootargs
setenv bootargs console=tty0 console=ttyS0,115200 root=/dev/mmcblk${bootdev}p2 no_console_suspend rootwait quiet
earlycon=uart,mmio32,0x01c28000 panic=10 consoleblank=0 loglevel=0
printenv
echo Loading DTB
load mmc 0:1 ${fdt_addr_r} /sun50i-a64-pinephone.dtb
echo Loading kernel Image
load mmc 0:1 ${kernel_addr_r} /Image
gpio set 115

echo Booting kernel NOW
gpio set 116
booti ${kernel_addr_r} - ${fdt_addr_r}

