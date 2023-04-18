docker ps -a # 查看所有容器

docker start id # 运行docker <id>

docker ps    # 查看正在运行的docker 

docker rename 老名字 新名字   # 重命名id



wget -qO- https://get.docker.com/ | bash  # 安装docker

docker pull dnomd343/cleardns   # 拉取docker hub镜像

docker save dnomd343/cleardns > cleardns.tar



# /system/device-mode/update container=yes      # reset or reboot ENABLE docker


# /container/config/set registry-url=https://registry-1.docker.io tmpdir=/pull 


create VETH_dns

Address=172.17.0.3/24 Gateway=172.17.0.1

create bridge

add address for bridge      Address= 172.17.0.1/24
add bridge port for VETH

IP - DNS - enable Allow Remote Requests

DNS=172.17.0.3
