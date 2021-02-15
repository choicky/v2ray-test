#!/bin/bash
TTI="$1"
UPLINKCAP="$2"
NIC=eth0 #network interface controller

sed -i "s/\"tti\"[^,]*,/\"tti\":${TTI},/g" /usr/local/etc/xray/config.json
sed -i "s/\"uplinkCapacity\"[^,]*,/\"uplinkCapacity\":${UPLINKCAP},/g" /usr/local/etc/xray/config.json
systemctl restart xray.service && \
    echo "$[TTI] $[UPLINKCAP] `awk '/'"$NIC"'/{print $2}' /proc/net/dev` `awk '/'"$NIC"'/{print $10}' /proc/net/dev`"\
    >>serverresult.txt
