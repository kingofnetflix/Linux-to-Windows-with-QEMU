#!/bin/bash

availableRAMcommand="free -m | tail -2 | head -1 | awk '{print \$7}'"
availableRAM=$(echo $availableRAMcommand | bash)
custom_param_ram="-m "$(expr $availableRAM - 856 )"M"
cpus=$(lscpu | grep CPU\(s\) | head -1 | cut -f2 -d":" | awk '{$1=$1;print}')


sudo wget -O lite11.qcow2 https://app.vagrantup.com/thuonghai2711/boxes/WindowsQCOW2/versions/1.0.2/providers/qemu.box

sudo apt-get install unzip curl qemu-kvm python3 gcc g++ make libglib2.0-dev \
libfdt-dev libpixman-1-dev zlib1g-dev pkg-config libjpeg-dev libssl-dev \
xz-utils libspice-protocol-dev libspice-server-dev -y

clear
echo "Qwiklabs Windows 11 by CVHNups"

nohup sudo kvm -nographic -net nic -net user,hostfwd=tcp::30889-:3389 -show-cursor $custom_param_ram -enable-kvm -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time,+nx -M pc -smp cores=$cpus -vga qxl -machine type=pc,accel=kvm -usb -device usb-tablet -k en-us -drive file=lite11.qcow2,index=0,media=disk,format=qcow2 -boot once=d &>/dev/null &

clear
echo User: Administrator
echo Password: Thuonghai001
echo Wait 2-4m VM boot up before connect. 
