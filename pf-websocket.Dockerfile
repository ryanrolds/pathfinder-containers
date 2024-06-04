FROM php:7.2.34-fpm-alpine3.12

RUN apk update \
    && apk add --no-cache git \
    $PHPIZE_DEPS && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY websocket /app
WORKDIR /app

RUN composer self-update 2.1.8
RUN composer install

ENTRYPOINT ["/usr/local/bin/php", "cmd.php"]
