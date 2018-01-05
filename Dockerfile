FROM php:5.6.32

MAINTAINER Liho <me@lehungio.com>

# init
RUN apt-get update && apt-get install -y git zip \
    && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer \
    && docker-php-ext-install pdo pdo_mysql \
    && git config --global url."https://".insteadOf git://

# dependencies
RUN apt-get update && apt-get upgrade -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpq-dev \
    libmagickwand-dev \
    libmcrypt-dev \
    libmcrypt-dev \
    libpng12-dev \
    libmemcached-dev \
    libssl-dev \
    libssl-doc \
    libsasl2-dev \
    zlib1g-dev \
    libicu-dev \
    g++

# php-lib
RUN docker-php-ext-install \
    iconv \
    mbstring \
    mcrypt \
    mysqli \
    pgsql \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    mysql

# phpunit
RUN curl -o phpunit -L https://phar.phpunit.de/phpunit-5.7.phar \
    && chmod +x phpunit \
    && mv phpunit /usr/local/bin/
