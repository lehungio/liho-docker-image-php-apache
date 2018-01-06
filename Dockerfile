FROM centos:6

MAINTAINER Liho <me@lehungio.com>

# EPEL 6
# https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
# RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Update PHP version
# RUN rpm -ivh https://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# Dependencies
RUN yum update -y
RUN yum install -y httpd
RUN yum install --enablerepo=epel,remi-php56,remi -y \
                              php php-devel php-intl \
                              php-cli php-curl \
                              php-gd \
                              php-mbstring \
                              php-mcrypt \
                              php-mysqlnd \
                              php-pdo \
                              php-xml \
                              php-xdebug \
                              php-memcached \
                              mysql-server \
                              phpmyadmin \
                              mod_ssl openssl \
                              rsync

RUN sed -i -e "s|^;date.timezone =.*$|date.timezone = Asia/Tokyo|" /etc/php.ini

# Default Docker Dev
COPY conf/httpd.conf /etc/httpd/conf.d/virtual.conf
# TODO: allow exclude cp !()
RUN shopt -s extglob

ENV HOME /root

EXPOSE 80
EXPOSE 8000

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
