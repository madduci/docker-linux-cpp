FROM ubuntu:22.04

LABEL maintainer="Michele Adduci <adduci@tutanota.com>" \
      license="MIT"

WORKDIR /project

ARG DEB_COMPILERS="g++-11 g++-12"
ARG EXTRA_CLANG_COMPILERS="15 16"

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

ENTRYPOINT [ "/usr/bin/g++-12" ]
