FROM debian:stable-slim

LABEL maintainer="Michele Adduci <adduci.michele@gmail.com>"

WORKDIR /project

ARG DEB_COMPILERS="clang-6.0 clang-7 gcc-7 gcc-8"
ARG EXTRA_CLANG_COMPILERS="8 9 10"

RUN echo "Installing required packages " \
         && export DEBIAN_FRONTEND=noninteractive  \
         && apt-get update \
         && apt-get install -y \
               wget \
               gnupg2 \
               lsb-release \
               apt-utils \
               software-properties-common \
         && apt-get autoremove --purge -y \
         && apt-get autoclean -y \
         && rm -rf /var/cache/apt/*

ADD install_compilers.sh /install_compilers.sh

RUN echo "Installing C++ Compilers" \
         && chmod +x /install_compilers.sh \
         && sh /install_compilers.sh "${DEB_COMPILERS}" "${EXTRA_CLANG_COMPILERS}"

ENTRYPOINT [ "/usr/bin/g++" ]