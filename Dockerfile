FROM ubuntu:16.04

MAINTAINER Filipe Vieira <filipevieiradossantos@gmail.com>

RUN apt-get update
RUN apt install -y wget libtommath-dev libicu-dev

EXPOSE 3050
