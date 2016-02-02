FROM ubuntu:14.04
MAINTAINER Wisya Yugaswara J <wisya.yugaswara@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  libapache2-mod-php5 libapache2-mod-rpaf libapache2-mod-security2 \
  libapache2-mod-evasive git curl php5-apcu php5-curl php5-gd \
  php5-mysql php5-sybase php5-pgsql php5-sqlite \
  php5-intl php5-mcrypt php5-imagick

RUN a2enmod rewrite

COPY apache2.conf /etc/apache2/apache2.conf
COPY php.ini /etc/php5/apache2/php.ini

WORKDIR /var/www/html

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
