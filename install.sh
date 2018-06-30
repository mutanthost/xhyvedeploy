#!/bin/sh
# on branch xenial 
# changed default values of MEM and commented out SMP from 1 each to 4
# mutanthost 06.30.2018
# codesigned binary to run completely in userspace
KERNEL="ubuntu/vmlinuz"
INITRD="ubuntu/initrd.gz"
CMDLINE="earlyprintk=serial console=ttyS0 acpi=off"

MEM="-m 4G"
SMP="-c 4"
NET="-s 2:0,virtio-net"
IMG_CD="-s 3,ahci-cd,ubuntu/ubuntu-16.04.4-server-amd64.iso"
IMG_HDD="-s 4,virtio-blk,ubuntu/hdd.img"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
LPC_DEV="-l com1,stdio"

build/xhyve $MEM $SMP $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD -f kexec,$KERNEL,$INITRD,"$CMDLINE"