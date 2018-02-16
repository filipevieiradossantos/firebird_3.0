FROM ubuntu:16.04

MAINTAINER Filipe Vieira <filipevieiradossantos@gmail.com>

RUN apt-get update
RUN apt install -y wget libtommath-dev libicu-dev
ADD ./arquivos/Firebird-3.0.3.32900-0.amd64.tar /firebird.tar


EXPOSE 3050
