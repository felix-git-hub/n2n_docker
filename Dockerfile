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

# hadolint ignore=DL3008
RUN set -x && \
    mkdir /config && \
    apt-get update -q && \
    apt-get install -q -y --no-install-recommends \
        wget \
    && apt-get clean


# Leave these args here to better use the Docker build cache

#user permission
WORKDIR /usr/sbin/


CMD [ "/init" ]
