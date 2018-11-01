#!/bin/bash
 
# Modify these!
VIP_ADDRESS=192.168.32.40
 
# Fail if vip address is not found from any interface when in MASTER status.
STATE=$(cat /tmp/keepalived-state)
if [ "$STATE" == "MASTER" ]; then
    vip=$(ip a | grep "$VIP_ADDRESS" |  wc -l)
 
    if [ $vip -eq 0 ]; then
        exit 1
    fi
fi
 
# Fail if nginx is not reachable.
PING=$(wget --spider http://localhost:8080/nginx_status)
if [ "$?" != "0" ]; then
    exit 1
fi
 
# Success.
exit 0

