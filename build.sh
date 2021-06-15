#!/bin/bash

docker rm -f dogecoin-node && \
docker build \
    --progress=plain \
    --compress \
    -t dogecoin-node .