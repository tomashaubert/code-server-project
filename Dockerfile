FROM php:8.0.2-apache
WORKDIR /var/www/html

RUN apt-get update

RUN apt-get install -y nano zip unzip

RUN apt-get install -y \
   && docker-php-ext-install mysqli \
   && docker-php-ext-install pdo_mysql \
   && pecl install xdebug-3.0.2 \
   && docker-php-ext-enable xdebug

# xdebug port
EXPOSE 9003