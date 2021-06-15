# Dogecoin Full Node Docker Edition

## Dogecoin Used:
- Dogecoin v1.14.3

## Features
- Dogecoin Daemon as service for auto-start after crash if it happens


## How to tun

1. Install docker
2. Build docker by using `build.sh`
3. Run docker by using `run.sh`

Note to running docker - you can set your own `IPADDR` at `-e` enviroment variable:

```bash
docker run -it \
    --name dogecoin-node \
    --mount type=bind,source=$workdir/mount/Dogecoin,target=/Dogecoin \ # choose your own mount directory
    -p 22556:22556 \
    --memory="2g" \
    --memory-swap="8g" \
    -e IPADDR='<ip-address>' \
    dogecoin-node
```
