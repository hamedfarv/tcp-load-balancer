# TCP Load Balancer
This project implements TCP Load Balancer with keepalived and nginx. The setup is as follows:

# Installation

## Pre-requisites
* At least two servers with:
** docker
** docker-compose
* VIP address

## Configure keepalived
Edit following in *keepalived.conf*:
* unicast_peer
* virtual_ipaddress

Edit VIP_ADDRESS in *check-status.sh*.

Make sure *check-status.sh* is executable:

`chmod +x check-status.sh`

## Configure nginx

Edit following in *nginx.conf*:
* ingress_servers_443
* ingress_servers_80

## Start-up

`docker-compose up -d`

