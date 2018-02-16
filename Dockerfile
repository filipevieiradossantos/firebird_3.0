FROM ubuntu:16.04
MAINTAINER Filipe Vieira <filipevieiradossantos@gmail.com>

ENV FBURL=https://github.com/FirebirdSQL/firebird/releases/download/R2_5_8/Firebird-2.5.8.27089-0.tar.bz2

RUN apt-get update
RUN apt install curl
RUN apt install -y wget libtommath-dev libicu-dev
RUN	mkdir -p /home/firebird && \
    cd /home/firebird && \
    curl -L -o firebird-source.tar.bz2 -L \
        "${FBURL}" && \
    tar --strip=1 -xf firebird-source.tar.bz2 && \

EXPOSE 3050
