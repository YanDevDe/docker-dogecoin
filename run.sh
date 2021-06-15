#!/bin/bash

# MNKEY and IPADDRE are example and not being used.

docker run -it \
    --name dogecoin-node \
    --mount type=bind,source=$(pwd)/mount/Dogecoin,target=/Dogecoin \
    -p 22556:22556 \
    --memory="8g" \
    --memory-swap="12g" \
    -e IPADDR='222.23.112.49' \
    dogecoin-node