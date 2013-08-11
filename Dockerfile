FROM ubuntu:12.04
MAINTAINER Mark Lemmon "mark.s.lemmon@gmail.com"

# This is the proxy on my machine.  Don't use this on your machine.
ENV http_proxy http://172.17.155.133:3128
ENV https_proxy http://172.17.155.133:3128

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install python-software-properties
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java7-installer

CMD /bin/bash

