FROM ubuntu:24.04

LABEL maintainer="Michele Adduci <michele@adduci.org>" \
      license="MIT"

WORKDIR /project

ARG DEB_COMPILERS="g++-12 g++-13 g++-14"
ARG EXTRA_CLANG_COMPILERS="19 20 21"

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

ENTRYPOINT [ "/usr/bin/g++-14" ]
