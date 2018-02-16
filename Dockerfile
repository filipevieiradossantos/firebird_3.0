FROM ubuntu:16.04

MAINTAINER Filipe Vieira <filipevieiradossantos@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
&& apt-get upgrade -y
&& apt-get install -y libncurses5-dev bzip2 curl gcc g++ make zlib1g-dev libicu-dev libtommath-dev libtommath0
&& mkdir -p /tmp/firebird3
&& cd /tmp/firebird3
&& curl -L -o firebird3.tar.bz2 "https://github.com/FirebirdSQL/firebird/releases/download/R3_0_3/Firebird-3.0.3.32900-0.arm.tar.gz"
&& tar --strip=1 -xf firebird3.tar.bz2
&& ./configure --enable-superserver --prefix=/opt/firebird3
&& make
&& make silent_install 
&& cd /
&& rm -R /tmp/firebird3
&& apt-get purge -y --auto-remove libncurses5-dev bzip2 curl gcc g++ make zlib1g-dev libtommath-dev

ADD run.sh /opt/firebird3/run.sh
RUN chmod 777 /opt/firebird3/run.sh

VOLUME ["/sqlbase"]

EXPOSE 3050

CMD ["/opt/firebird3/run.sh"]