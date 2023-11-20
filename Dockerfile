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
RUN apt-get update -q && \
    apt-get install -q -y --no-install-recommends \
        wget \
    && apt-get clean \
    && wget -O n2n.deb https://github.com/ntop/n2n/releases/download/3.1.1/n2n_3.1.1_amd64.deb \
    && dpkg -i n2n.deb \
    && rm n2n.deb \
    && rm -rf /var/lib/apt/lists/* && \
  echo "**** create abc user and make our folders ****" && \


# Leave these args here to better use the Docker build cache

#user permission
WORKDIR /config
USER abc

RUN set -x && \
    whoami &&\
    UNAME_M="$(uname -m)" && \


CMD [ "/init" ]
