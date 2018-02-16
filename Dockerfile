FROM ubuntu:16.04
MAINTAINER Filipe Vieira

ENV container docker 

RUN cd /
RUN wget https://github.com/FirebirdSQL/firebird/releases/download/R3_0_3/Firebird-3.0.3.32900-0.amd64.tar.gz
RUN tar -xpzvf Firebird-3.0.2.32703-0.amd64.tar.gz; \
RUN apt-get update
RUN apt-get install libstdc++5
RUN wget http://ftp.br.debian.org/debian/pool/main/g/gcc-3.3/libstdc++5_3.3.6-28_amd64.deb
RUN dpkg -i libstdc++5_3.3.6-28_amd64.deb
RUN cd Firebird-3.0.3.32900-0.amd64
RUN apt-get install libtommath-dev
RUN ./install.sh
RUN filipe@vieira
RUN systemctl enable firebird-superserver.service
RUN systemctl start firebird-superserver.service
RUN iptables -A INPUT -p tcp --dport 3050 -j ACCEPT
RUN iptables -A INPUT -p udp --dport 3050 -j ACCEPT
RUN iptables -I INPUT -p tcp --dport 3050 -j ACCEPT

RUN sudo iptables-save -c
RUN cd /opt/firebird
RUN mkdir data

RUN chown -R firebird data
RUN chgrp -R firebird data
