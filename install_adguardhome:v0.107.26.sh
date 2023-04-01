# docker install scripts
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

#  docker pull adguard/adguardhome:v0.107.26
#  docker save adguard/adguardhome:v0.107.26 > adguard.tar



docker run --name adguardhome\
    --restart unless-stopped\
    -v /my/own/workdir:/opt/adguardhome/work\
    -v /my/own/confdir:/opt/adguardhome/conf\
    -p 53:53/tcp -p 53:53/udp\
    -p 67:67/udp -p 68:68/udp\
    -p 80:80/tcp -p 443:443/tcp -p 443:443/udp -p 3000:3000/tcp\
    -p 853:853/tcp\
    -p 784:784/udp -p 853:853/udp -p 8853:8853/udp\
    -p 5443:5443/tcp -p 5443:5443/udp\
    -d adguard/adguardhome


# /system/device-mode/update container=yes      # reset or reboot ENABLE docker


# /container/config/set registry-url=https://registry-1.docker.io tmpdir=/pull 


create VETH_dns

Address=172.17.0.3/24 Gateway=172.17.0.1

create bridge

add address for bridge      Address= 172.17.0.1/24
add bridge port for VETH

IP - DNS - enable Allow Remote Requests

Remote image：adguard/adguardhome

# mount: auto

Src:  /opt/adguardhome/work  Dst:  /opt/adguardhome/work
Src:  /opt/adguardhome/conf   Dst:  /opt/adguardhome/conf

# Workdir: auto 
/opt/adguardhome/work


IP - firewall - NAT
dstnat TCP Dst. port 3000  action=dst-nat To address To ports 3000

IP - dns:
172.17.0.3

local:
IP-DNS remote  172.17.0.1
