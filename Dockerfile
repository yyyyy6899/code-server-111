FROM lscr.io/linuxserver/code-server:latest

ENV TZ=Etc/UTC \
    DEFAULT_WORKSPACE=/config/workspace \
    PWA_APPNAME=code-server

EXPOSE 8443
VOLUME ["/config"]

USER root
