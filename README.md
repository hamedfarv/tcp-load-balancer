# TCP Load Balancer

## Description

This project implements TCP Load Balancer with keepalived and nginx. The setup is as follows:

```mermaid
graph LR
  user -->|ports 80 & 443| vip
  ng1 --- t1
  ng1 --- t2
  ng1 --- t3
  subgraph 
    subgraph load-balancer-1
      vip((vip)) -.- ng1(nginx)
      kl1(keepalived) --- |health check: localhost:8080/nginx-status| ng1 
    end
    subgraph load-balancer-2
      kl2(keepalived) --- ng2(nginx)
    end
  end
  subgraph 
    subgraph Upstream
      t1(Target-1)  
      t2(Target-2)  
      t3(Target-3)  
    end
  end
```

There can be any number of load balancer and upstream servers. Both keepalived and nginx are un in containers with docker-compose.

## Installation

Clone this repo to each load balancer server and modify configuration as desribed below.

### Pre-requisites

1. At least two servers with:
   * docker
   * docker-compose
   * ports 80 and 443 open
2. VIP address

### Configure keepalived

1. Copy `env-template` to `.env` and edit parameter values in the new .env file if needed.
2. Make sure `check-status.sh` is executable: `chmod +x check-status.sh` 

### Configure nginx

Edit target server addresses to following blocks in `nginx.conf`:

* upsteam_443
* upstream_80

## Operation

### Start-up

`docker-compose up -d`

### Stop

`docker-compose down`
