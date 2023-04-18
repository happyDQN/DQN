docker ps -a # 查看所有容器

docker start id # 运行docker <id>

docker ps    # 查看正在运行的docker 

docker rename 老名字 新名字   # 重命名id



wget -qO- https://get.docker.com/ | bash  # 安装docker

docker pull dnomd343/cleardns   # 拉取docker hub镜像

docker run -dt --network host \
  --restart always \
  --name cleardns --hostname cleardns \
  --volume /etc/cleardns/:/cleardns/ \
  --volume /etc/timezone:/etc/timezone:ro \
  --volume /etc/localtime:/etc/localtime:ro \
  dnomd343/cleardns
