网络基本情况
routeros作为家庭唯一路由，通过pppoe接入互联网，通过openwrt连接香港

策略路由目标
1，需要翻墙的内网ip：目的地址是境内ip走pppoe默认路由，目的地址是境外IP走openwrt通过香港进入墙外互联网
2，其他内网ip全部走pppoe默认路由


本地lan的地址是192.168.88.1/24,笔记本电脑的地址是192.168.88.100-192.168.88.254
香港地址是192.168.88.99/32

配置步骤
1，使用ipip.net发布在github的大陆ip列表生成境内IP地址列表，并导入routeros
在mac或者linux系统上执行下列命令

curl -s https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt |sed -e 's/^/add address=/g' -e 's/$/ list=CNIP/g'|sed -e $'1i\\\n/ip firewall address-list' -e $'1i\\\nremove [/ip firewall address-list find list=CNIP]' -e $'1i\\\nadd address=10.0.0.0/8 list=CNIP comment=private-network' -e $'1i\\\nadd address=172.16.0.0/12 list=CNIP comment=private-network' -e $'1i\\\nadd address=192.168.0.0/16 list=CNIP comment=private-network'>cnip.rsc
把cnip.rsc上传到routeros，执行

/import cnip.rsc


2，配置分流路由表


/routing/table/add name="WWW" fib


添加IP分流策略路由


/ip/route/add dst-address=0.0.0.0/0 routing-table="WWW" gateway=192.168.88.99


3，新建需要翻墙的内网地址列表，假定192.168.88.100-192.168.88.254需要翻墙

/ip/firewall/address-list/add list=WWW address=192.168.88.100-192.168.88.254

4，给需要翻墙的内网ip添加标记

/ip/firewall/mangle/add chain=prerouting action=mark-routing new-routing-mark=WWW passthrough=yes dst-address-type=!local src-address-list=WWW dst-address-list=!CNIP log=no log-prefix=""


5，配置无污染DNS服务器
   192.168.88.99



