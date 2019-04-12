#!/bin/bash
 
# Fail if nginx is not reachable.
PING=$(wget --spider http://localhost:8080/nginx_status)
if [ "$?" != "0" ]; then
    exit 1
fi
 
# Success.
exit 0

