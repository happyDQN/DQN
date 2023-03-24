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



### 以前的

MikroTik Installer Script
Convert Ubuntu22 / Debian11 to MikroTik RouterOS



0.记录vps ip
1.以root身份登录
2.注意网关
-如何查看网关：
# ip route list | grep default   =?eth0


# fdisk -l   =? /dev/vda      (无数字)



如果错误 - 执行此命令：
# fdisk -lu chr.img
.img.2 start 数字*512=offset
mount -t auto -o loop,offset=$((1*512)) chr.img /mnt/ 


chr-7.6.img offset=33571840

chr-6.49.7.img   offset=512





# wget https://raw.githubusercontent.com/happy201807/onekey_sh/main/Mikrotik_installer.sh &&chmod +x * && ./Mikrotik_installer.sh

# echo b > /proc/sysrq-trigger
之后会reboot 若成功，此时登录winbox即可


winbox

DNS= 

IP service 禁用 api api-ssl ftp ssh telnet www 只留winbox（手机、win通用）

注册license


NAT :
IP-firewall-NAT add chain=srcnat Out interface=ether1 Action=masquerade



