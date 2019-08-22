FROM debian:stable-slim

LABEL maintainer="Michele Adduci <adduci.michele@gmail.com>"

WORKDIR /project

RUN echo "*** Installing g++ ***" \
  && DEBIAN_FRONTEND=noninteractive apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get update \
  && apt-get install -y cmake \
  && apt-get install -y g++ \
  && apt-get autoremove --purge -y \
  && apt-get autoclean -y \
  && rm -rf /var/cache/apt/* /tmp/* 

ENTRYPOINT [ "/usr/bin/g++" ]