FROM golang:1.20-bullseye

WORKDIR /

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install make git zlib1g-dev libssl-dev gperf php-cli cmake g++

# TDLIB installation guide for Ubuntu22/Golang/GCC here: https://tdlib.github.io/td/build.html?language=Go
# Repository here: https://github.com/tdlib/td
ARG TDLIB_VERSION_DATE='2024-01-19'
RUN git clone --depth 1 --branch master https://github.com/tdlib/td.git && \
    cd td && \
    rm -rf build && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local .. && \
    cmake --build . --target install && \
    cd .. && \
    cd ..
RUN ldconfig
RUN rm -rf td

RUN apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/apt/lists/* \
