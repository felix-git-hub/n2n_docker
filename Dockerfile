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
    mkdir /config && \
    which dpkg

# Leave these args here to better use the Docker build cache    

#user permission
WORKDIR /usr/sbin/


CMD [ "/config/init" ]
