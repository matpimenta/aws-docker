FROM ubuntu:14.04
MAINTAINER Mateus Pimenta

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y wget openjdk-7-jre-headless curl unzip

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN wget -O /tmp/go-server.deb http://download.go.cd/gocd-deb/go-server-14.4.0-1356.deb
RUN dpkg -i /tmp/go-server.deb
RUN rm /tmp/go-server.deb

EXPOSE 8153

CMD ["/etc/init.d/go-server", "start"]
CMD /etc/init.d/go-server start && tail -f /var/log/go-server/go-server.log
