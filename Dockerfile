FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git unzip libpq-dev

RUN docker-php-ext-install pdo pdo_pgsql

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# RUN chown -R www-data:www-data storage bootstrap/cache public/build vendor \
#     && chmod -R 775 storage bootstrap/cache public/build vendor

CMD ["php-fpm"]

