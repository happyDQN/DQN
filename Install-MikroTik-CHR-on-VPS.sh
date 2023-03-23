Install-MikroTik-CHR-on-VPS

nano c.sh ctrl +c/ctrl +v


#!/bin/bash
echo "Welcome to Cloudzy! MikroticOS will be installed on your VPS in a few seconds :)"
wget https://download.mikrotik.com/routeros/7.8/chr-7.8.img.zip -O chr.img.zip  && \
gunzip -c chr.img.zip > chr.img  && \
mount -o loop,offset=33571840 chr.img /mnt && \
ADDRESS=`ip addr show eth0 | grep global | cut -d' ' -f 6 | head -n 1` && \
GATEWAY=`ip route list | grep default | cut -d' ' -f 3` && \
echo "/ip address add address=$ADDRESS interface=[/interface ethernet find where name=ether1]
/ip route add gateway=$GATEWAY
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





ip addr show 
fdisk -lu


查看镜像的Start值  fdisk -lu chr.img   
如果[chr.img2]Start值不是1， 那么请注意下面的命令.
 Device                 Boot            Start            End            Blocks Id System
chr.img1                 *               34            15358139        7679038+ 83 Linux
chr.img2                                65570      

第2个[chr.img2]的开始扇区为65570。所以要跳过的字节数为 65570*512 offset=512*65570
