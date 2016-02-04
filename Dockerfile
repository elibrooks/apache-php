FROM debian:jessie
MAINTAINER Wisya Yugaswara J <wisya.yugaswara@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  libapache2-mod-php5 libapache2-mod-rpaf libapache2-mod-security2 \
  libapache2-mod-evasive git curl php5-apcu php5-curl php5-gd \
  php5-mysql php5-sybase php5-pgsql php5-sqlite \
  php5-intl php5-mcrypt php5-imagick
  
RUN curl -o /tmp/mod-pagespeed.deb https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb \ 
  && dpkg -i /tmp/mod-pagespeed.deb \ 
  && apt-get -f install


RUN a2enmod rewrite expires headers

COPY apache2.conf /etc/apache2/apache2.conf
COPY php.ini /etc/php5/apache2/php.ini
COPY modsecurity.conf /etc/modsecurity/modsecurity.conf

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/apache2/access.log \
	&& ln -sf /dev/stderr /var/log/apache2/error.log

EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
