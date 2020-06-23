# docker-linux-cpp

[![Build Status](https://travis-ci.org/madduci/docker-linux-cpp.svg?branch=master)](https://travis-ci.org/madduci/docker-linux-cpp)

A basic docker image for C++ developers, featuring g++ (from 8 to 10) and clang (from 9 to 10). The default compiler is g++9, but you're free to modify the Dockerfile and set your own.

As default working directory, `/project` is being used, but feel free to change it.

## Requirements

* Docker (possibly the latest version)

## Note

Since the Debian repository are changing rapidly, older versions of g++ and newer versions of clang aren't available in repositories anymore.

## Build/Run instructions

You can just type in your terminal:

`docker pull madduci/docker-linux-cpp`

to use my docker image or, in case of adjustments to the `Dockerfile`, just type:

`docker run --rm -it -v /your/folder:/project madduci/docker-linux-cpp my_file.cpp`
