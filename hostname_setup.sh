#!/bin/bash

echo "Enter hostname: "
read hostname_input
echo "NETWORKING=yes"           >  /etc/sysconfig/network
echo "HOSTNAME=$hostname_input" >> /etc/sysconfig/network
