FROM php:8.1.14-fpm-alpine3.17

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

RUN apk update
RUN apk add bash
RUN apk add curl

# INSTALL COMPOSER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

USER www-data

COPY --chown=www-data ./app/composer.json .
COPY --chown=www-data ./app/composer.lock .

RUN composer install --no-scripts

COPY --chown=www-data ./app .