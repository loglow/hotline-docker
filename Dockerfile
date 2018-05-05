FROM php:7.1.8-apache

COPY ./hotline /hotline
COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf

WORKDIR "/hotline"

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-interaction
RUN chown -R www-data:www-data /hotline
RUN docker-php-ext-install mbstring pdo pdo_mysql