FROM debian:stable-slim

LABEL maintainer="info@micheleadduci.net"

WORKDIR /project

RUN echo "*** Installing gcc (4.9->7) and clang (3.8->5) ***" \    
  && echo "deb http://ftp.us.debian.org/debian jessie main contrib non-free" >> /etc/apt/sources.list.d/jessie.list \
  && echo "deb http://ftp.us.debian.org/debian unstable main contrib non-free" >> /etc/apt/sources.list.d/unstable.list \
  && apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install -y \
  cmake \
  && apt-get install -y g++-4.9 g++-5 g++-6 g++-7 \
  && apt-get install -y clang++-3.8 \
  && apt-get install -y clang++-3.9 \
  && apt-get install -y clang++-4.0 \
  && apt-get install -y clang++-5.0 \
  && apt-get autoremove --purge -y \
  && apt-get autoclean -y \
  && rm -rf /var/cache/apt/* /tmp/* \
  && echo "Setting g++ 7 as default compiler" \
  && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 1

ENTRYPOINT [ "/usr/bin/g++" ]