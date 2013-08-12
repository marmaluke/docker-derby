FROM centos 
MAINTAINER Mark Lemmon "mark.s.lemmon@gmail.com"

# This is the proxy on my machine.  Don't use this on your machine.
ENV http_proxy http://172.17.155.133:3128
ENV https_proxy http://172.17.155.133:3128

#RUN yum -y update
RUN yum -y install java-1.7.0-openjdk.x86_64
ENV JAVA_HOME /usr/lib/jvm/jre/

# install derby
RUN wget http://apache.insync.za.net//db/derby/db-derby-10.10.1.1/db-derby-10.10.1.1-bin.tar.gz
RUN mkdir /opt/apache
RUN mv db-derby-10.10.1.1-bin.tar.gz /opt/apache 
RUN cd /opt/apache; tar xzvf db-derby-10.10.1.1-bin.tar.gz

ENV DERBY_HOME /opt/apache/db-derby-10.10.1.1-bin
ENV CLASSPATH ${DERBY_HOME}/lib/derbynet.jar:${DERBY_HOME}/lib/derbytools.jar:${DERBY_HOME}/lib/derbyclient.jar


CMD java -cp ${CLASSPATH} org.apache.derby.drda.NetworkServerControl start

