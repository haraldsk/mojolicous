FROM ubuntu:precise

MAINTAINER Harald Skoglund "haraldsk@redpill-linpro.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install dialog net-tools lynx nano wget vim
RUN apt-get -y install python-software-properties
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update

RUN apt-get -y install nginx libmojolicious-perl libmojo-server-fastcgi-perl
RUN apt-get -y install libdir-self-perl libdigest-sha-perl

# RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /srv/app

RUN echo "26-Dec-13 22:57"

RUN wget -O /srv/app/app https://raw.github.com/haraldsk/mojolicous/master/app
RUN wget -O /srv/app/hypnotoad.conf https://raw.github.com/haraldsk/mojolicous/master/hypnotoad.conf
RUN chmod 755 /srv/app/app

EXPOSE 8080

CMD hypnotoad -f /srv/app/app
