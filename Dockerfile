FROM debian:stable-slim

LABEL maintainer="Michele Adduci <adduci.michele@gmail.com>"

WORKDIR /project

RUN echo "*** Installing C++ Compilers ***" \
  && DEBIAN_FRONTEND=noninteractive apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install -y \
    clang-6.0 \
    clang-7 \
    g++-8 \
  && apt-get autoremove --purge -y \
  && apt-get autoclean -y \
  && rm -rf /var/cache/apt/* /tmp/* 

ENTRYPOINT [ "/usr/bin/g++" ]