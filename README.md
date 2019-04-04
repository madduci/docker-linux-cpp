# docker-linux-cpp

[![Build Status](https://travis-ci.org/madduci/docker-linux-cpp.svg?branch=master)](https://travis-ci.org/madduci/docker-linux-cpp)

A basic docker image for C++ developers, featuring g++ (from 4.9 up to 8.x) and CMake support. The default compiler is g++ 8, but you're free to modify the Dockerfile and set your own; as example, if you want to set g++ 4.9 as the default compiler, just write the following Dockerfile and build a new image:

```
# Dockerfile
FROM madduci/docker-linux-cpp:latest

RUN update-alternatives --remove g++ /usr/bin/g++-8 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 1
```

```
$> docker build -t docker-gcc-4.9 .
```

As default working directory, `/project` is being used, but feel free to change it.

## Requirements

* Docker (possibly the latest version)

## Note

Since the Debian repository are changing rapidly, it wasn't possible to add clang directly, as well as g++ 5, which was removed

## Build/Run instructions

You can just type in your terminal:

`docker pull madduci/docker-linux-cpp`

to use my docker image or, in case of adjustments to the `Dockerfile`, just type:

`docker run --rm -it -v /your/folder:/project madduci/docker-linux-cpp my_file.cpp`
