FROM php:8.1-apache

RUN apt-get update

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN a2enmod rewrite
RUN a2enmod headers
RUN service apache2 restart