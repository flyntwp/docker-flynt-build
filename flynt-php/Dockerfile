FROM php:7.2-fpm-alpine

# docker-entrypoint.sh dependencies
RUN apk add --no-cache \
# in theory, docker-entrypoint.sh is POSIX-compliant, but priority is a working, consistent image
  bash \
# BusyBox sed is not sufficient for some of our sed expressions
  sed

# install the PHP extensions we need
RUN set -ex; \
  \
  apk add --no-cache --virtual .build-deps \
  libjpeg-turbo-dev \
  libpng-dev \
  ; \
  \
  docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
  docker-php-ext-install gd mysqli opcache; \
  \
  runDeps="$( \
  scanelf --needed --nobanner --recursive \
  /usr/local/lib/php/extensions \
  | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
  | sort -u \
  | xargs -r apk info --installed \
  | sort -u \
  )"; \
  apk add --virtual .wordpress-phpexts-rundeps $runDeps; \
  apk del .build-deps

COPY conf/* /usr/local/etc/php/conf.d/
