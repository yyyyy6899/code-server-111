FROM lscr.io/linuxserver/code-server:latest

ENV TZ=Etc/UTC \
    DEFAULT_WORKSPACE=/config/workspace \
    PWA_APPNAME=code-server \
    PASSWORD=JGG8Z7se4!UM#c7R6Q#%#K#&^9isH$

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        curl \
        htop \
        nano \
        iptables \
        openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8443
VOLUME ["/config"]
