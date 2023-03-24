#!/bin/bash
echo "Welcome to Cloudzy! MikroticOS will be installed on your VPS in a few seconds :)"
wget https://download.mikrotik.com/routeros/7.8/chr-7.8.img.zip -O chr.img.zip  && \
gunzip -c chr.img.zip > chr.img  && \
mount -o loop,offset=33571840 chr.img /mnt && \
ADDRESS=`ip addr show eth0 | grep global | cut -d' ' -f 6 | head -n 1` && \
GATEWAY=`ipv6 route list | grep default | cut -d' ' -f 3` && \
echo "/ipv6 address add address=$ADDRESS interface=[/interface ethernet find where name=ether1]
/ipv6 route add gateway=$GATEWAY
/ip service disable telnet
/user set 0 name=root password=$pass
 " > /mnt/rw/autorun.scr && \
umount /mnt && \
echo u > /proc/sysrq-trigger && \
dd if=chr.img bs=1024 of=/dev/vda && \
echo "sync disk" && \
echo s > /proc/sysrq-trigger && \
echo "Sleep 5 seconds" && \
sleep 5 && \
echo "Ok, we're rebooting.." && \
echo b > /proc/sysrq-trigger
