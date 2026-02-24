FROM lscr.io/linuxserver/code-server:latest

ENV TZ=Etc/UTC \
    DEFAULT_WORKSPACE=/config/workspace \
    PWA_APPNAME=code-server

USER root

# Install basic utilities
RUN apk update && apk add --no-cache \
    wget \
    curl \
    htop \
    nano \
    iptables

EXPOSE 8443
VOLUME ["/config"]
