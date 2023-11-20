FROM debian:bookworm-slim


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
ADD https://github.com/ntop/n2n/releases/download/3.1.1/n2n_3.1.1_amd64.deb /tmp

# hadolint ignore=DL3008
RUN set -x && \
    mkdir /config  && \
    uname -a &&\
  apt-get update && \
  apt-get install -y \
  /tmp/n2n_3.1.1_amd64.deb  
#user permission
WORKDIR /sbin/


CMD [ "/init" ]
