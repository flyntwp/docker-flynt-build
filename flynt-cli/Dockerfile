FROM alpine:3.7

RUN apk add --no-cache --virtual .osDeps \
  git \
  openssh-client \
  rsync \
  curl \
  ca-certificates \
  vim

RUN apk add --no-cache --virtual .runDeps \
  mysql-client \
  php7 \
  nodejs \
  nodejs-npm
  # yarn

RUN npm i -g yarn && \
  yarn global add \
    gulp \
    bower \
    @flyntwp/flynt-cli

RUN apk add --no-cache --virtual .phpPackages \
  php7-json \
  php7-zlib \
  php7-xml \
  php7-pdo \
  php7-phar \
  php7-openssl \
  php7-pdo_mysql \
  php7-mysqli \
  php7-session \
  php7-gd \
  php7-iconv \
  php7-mcrypt \
  php7-curl \
  php7-opcache \
  php7-ctype \
  php7-apcu \
  php7-intl \
  php7-bcmath \
  php7-mbstring \
  php7-dom \
  php7-xmlreader \
  php7-soap \
  php7-xmlwriter \
  php7-simplexml \
  php7-tokenizer && \
  ln -fs /etc/php7 /etc/php && \
  ln -fs /usr/bin/php7 /usr/bin/php && \
  ln -fs /usr/lib/php7 /usr/lib/php

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
  php composer-setup.php --install-dir=/usr/bin --filename=composer && \
  php -r "unlink('composer-setup.php');"

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
  chmod +x wp-cli.phar && \
  mv wp-cli.phar /usr/bin/wp

# RUN mkdir -p /var/www/html/vendor
# RUN mkdir -p /var/www/html/web/app/themes
# RUN mkdir -p /var/www/html/web/app/uploads
# RUN mkdir -p /var/www/html/web/wp
# RUN mkdir -p /var/www/html/theme/node_modules
# RUN mkdir -p /var/www/html/theme/bower_components

# RUN addgroup -g 82 www-data && \
#   adduser -u 82 -G www-data -s /bin/sh -D www-data

# RUN chown -R www-data:www-data /var/www/html
# RUN chown -R flynt:flynt /var/www/html/vendor
# RUN chown -R flynt:flynt /var/www/html/theme

# USER www-data

# RUN mkdir -p /home/www-data/.composer
# RUN mkdir -p /home/www-data/.ssh
RUN mkdir -p /root/.composer
RUN mkdir -p /root/.ssh

WORKDIR /var/www/html

# COPY init.sh /usr/bin/

# ENTRYPOINT ["init.sh"]
