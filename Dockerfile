FROM debian:bookworm-slim

ENV ARCH=amd64

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CERTBOT_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="felix"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8



#copy file
COPY root/ /
#sudo permission
#ADD --chmod=yyy https://github.com/ntop/n2n/releases/download/3.1.1/n2n_3.1.1_amd64.deb /tmp

# hadolint ignore=DL3008
RUN set -x && \
    mkdir /config  && \
    uname -a &&\
    chmod +x /n2n/* && \
    apt-get update -q && \
    apt-get install -q -y --no-install-recommends \
        socat\ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
#user permission
WORKDIR /n2n/


CMD [ "bash /init" ]
