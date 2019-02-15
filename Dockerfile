FROM phpdockerio/php72-fpm:latest
WORKDIR "/application"

COPY composer.json composer.lock symfony.lock  /application/

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.2-fpm php7.2-common php7.2-gd \
       php7.2-xml php7.2-xsl php7.2-xdebug php7.2-mbstring php7.2-mysql\
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install git
RUN apt-get update \
    && apt-get -y install git \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY phpdocker/php/xdebug.ini /etc/php/7.2/fpm/conf.d/20-xdebug.ini