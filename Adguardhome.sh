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


# /container/config/set registry-url=https://registry-1.docker.io tmpdir=/pull 配置pull参数


create VETH         Address=172.17.0.2/24 Gateway=172.17.0.1
create bridge
add address for bridge      Address= 172.17.0.1/24
add bridge port for VETH

IP - DNS - enable Allow Remote Requests

Remote image：adguard/adguardhome

# mount:

Src:  /opt/adguardhome/work  Dst:  /opt/adguardhome/work
Src:  /opt/adguardhome/conf   Dst:  /opt/adguardhome/conf

Workdir: auto 
/opt/adguardhome/work


IP - firewall - NAT
dstnat TCP Dst. port 3000  action=dst-nat To address To ports 3000

dstnat TCP Dst. port 80  action=dst-nat To address To ports 80

dstnat TCP Dst. port 8443  action=dst-nat To address To ports 443 

Certificate    *.emample.com  Cloudfare DNS api

DNS-over-TLS error :
validating certificate pair: certificate has no IP addresses, this may cause issues with DNS-over-TLS clients


# /container/set 0 start-on-boot=yes   

local:
IP-DNS remote


