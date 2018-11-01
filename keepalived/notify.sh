#!/bin/bash
 
# for ANY state transition.
# "notify" script is called AFTER the
# notify_* script(s) and is executed
# with 3 arguments provided by keepalived
# (ie don't include parameters in the notify line).
# arguments
# $1 = "GROUP"|"INSTANCE"
# $2 = name of group or instance
# $3 = target state of transition
#     ("MASTER"|"BACKUP"|"FAULT")
 
TYPE=$1
NAME=$2
STATE=$3
 
# Save state to file so it can be read by other scripts.
echo "$STATE" > /tmp/keepalived-state
 
echo "Moving to $STATE state!" > /proc/1/fd/1
 
case $STATE in
        "MASTER" | "BACKUP" | "FAULT") exit 0
                  ;;
        *)        echo "Unknown state!" > /proc/1/fd/1
                  exit 1
                  ;;
esac

