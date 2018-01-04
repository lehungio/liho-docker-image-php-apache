FROM php:5.6.32

MAINTAINER Liho <me@lehungio.com>

# init
RUN apt-get update && apt-get install -y git \
    && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer \
    && docker-php-ext-install pdo pdo_mysql \
    && git config --global url."https://".insteadOf git://

# phpunit
RUN curl -o phpunit -L https://phar.phpunit.de/phpunit-5.7.phar \
    && chmod +x phpunit \
    && mv phpunit /usr/local/bin/

# php-curl
RUN apt-get install -y php5-curl

EXPOSE 8000
