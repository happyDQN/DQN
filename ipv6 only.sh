/ipv6 settings set forward=no
/ipv6 address add interface=ether1 advertise=no  address=2001:b030:c11b:x00::a/72
/ipv6 address add interface=ether1 advertise=no  address=2001:b030:c11b:x00::b/72
/ipv6 route add distance=1 gateway=2001:b030:c11b:x00::1


需要手动再次add address后才激活gateway


然后  /system reboot
y

重启后正常了


warp、DNS、route、激活、clock、new-mss=clamp-to-pmtu、wg、NAT
