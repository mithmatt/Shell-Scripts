#!/bin/bash

LNO=$(ifconfig | grep -n "eth0" | awk 'BEGIN{FS=":"}; {print $1}')
IPADDR=$(ifconfig | awk -v lnr="$(($LNO+1))" 'NR==lnr {print $2}' | cut -d ':' -f2)

echo "DEVICE=\"eth0\""           >  /etc/sysconfig/network-scripts/ifcfg-eth0
echo "BOOTPROTO=\"static\""      >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "IPV6INIT=\"yes\""          >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "MTU=\"1500\""              >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "NM_CONTROLLED=\"no\""      >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "ONBOOT=\"yes\""            >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "TYPE=\"Ethernet\""         >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "IPADDR=$IPADDR"   	       >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "NETMASK=255.255.240.0"     >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "GATEWAY=172.17.0.1"        >> /etc/sysconfig/network-scripts/ifcfg-eth0

service network restart

