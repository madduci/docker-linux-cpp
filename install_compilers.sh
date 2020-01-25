#!/bin/bash

readonly DEBIAN_PACKAGES="${1}"
readonly CLANG_PACKAGES="${2}"

DEBIAN_FRONTEND=noninteractive 
apt-get update 
apt-get install -y ${DEBIAN_PACKAGES}

wget -O /tmp/llvm.sh https://apt.llvm.org/llvm.sh 
chmod +x /tmp/llvm.sh 

IFS=" " read -ra clang_versions <<< ${CLANG_PACKAGES}
for i in "${clang_versions[@]}" ; 
do 
    sh /tmp/llvm.sh "$i" ; 
done 

apt-get autoremove --purge -y 
apt-get autoclean -y 
rm -rf /var/cache/apt/* /tmp/* 