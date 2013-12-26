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

RUN wget -O /etc/nginx/sites-available/default https://raw.github.com/haraldsk/mojolicious/master/default
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /var/www
RUN wget -O /var/www/index.cgi https://raw.github.com/vti/pastelicious/master/pastelicious

EXPOSE 80

CMD service nginx start
