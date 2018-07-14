#!/bin/sh
# changed to 4 G RAM 4 CPU and 4.4. kernel
KERNEL="ubuntu/boot/vmlinuz-4.4.0-116-generic"
INITRD="ubuntu/boot/initrd.img-4.4.0-116-generic"
CMDLINE="earlyprintk=serial console=ttyS0 acpi=off root=/dev/vda1 rw init=/bin/bash"

MEM="-m 4G"
SMP="-c 4"
NET="-s 2:0,virtio-net"
IMG_HDD="-s 4,virtio-blk,ubuntu/hdd.img"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
LPC_DEV="-l com1,stdio"

build/xhyve $MEM $SMP $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD -f kexec,$KERNEL,$INITRD,"$CMDLINE"