#!/usr/bin/env bash

readonly DEBIAN_PACKAGES="${1}"
readonly CLANG_PACKAGES="${2}"

DEBIAN_FRONTEND=noninteractive
add-apt-repository -y ppa:ubuntu-toolchain-r/test \
apt-get update

echo "Installing ${DEBIAN_PACKAGES}"
apt-get install -y ${DEBIAN_PACKAGES} libstdc++6

wget -O /tmp/llvm.sh https://apt.llvm.org/llvm.sh
chmod +x /tmp/llvm.sh

echo "Installing ${CLANG_PACKAGES}"
for version in ${CLANG_PACKAGES}
do
    /tmp/llvm.sh $version
done

apt-get autoremove --purge -y
apt-get autoclean -y
rm -rf /var/cache/apt/* /tmp/*
