# syntax=docker/dockerfile:1

FROM amd64/ubuntu:20.04

ENV EXT=".tar.gz"
ENV BINARY_URL="https://github.com/dogecoin/dogecoin/releases/download/v1.14.3/dogecoin-1.14.3-x86_64-linux-gnu.tar.gz"

ENV WORK_DIR="/Dogecoin"
ENV DATA_PATH="${WORK_DIR}/.dogecoin"
ENV CONFIG_PATH="${DATA_PATH}/dogecoin.conf"

# Add dogecoin daemon and client to bin directory
ADD ${BINARY_URL} /tmp/
RUN tar -xvf /tmp/dogecoin*${EXT} -C /tmp/
RUN cp /tmp/dogecoin*/bin/* /usr/local/bin
RUN rm -rf /tmp/dogecoin*

# Update + install needed dependencies
RUN apt-get -y update
RUN apt-get -y install -qq --force-yes pwgen systemctl

# Create systemctl service
ADD /files/dogecoin.service /etc/systemd/system/dogecoin.service

# Add command files
ADD ./bin/* /usr/local/bin/
RUN chmod a+x /usr/local/bin/*

# Expose Port for Dogecoin
EXPOSE 22556:22556

SHELL ["/bin/bash", "-c"]

CMD ["doge-start"]