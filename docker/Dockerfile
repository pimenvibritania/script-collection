FROM php:8.1.0-fpm

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    vim \
    unzip

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd xdebug pdo-mysql

RUN docker-php-ext-install pdo pdo_mysql
# RUN a2enmod rewrite

#Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/

# RUN docker-php-ext-enable xdebug
# RUN mkdir -p /home/xdebug

# COPY ./php/xdebug-debug.ini /home/xdebug/xdebug-debug.ini
# COPY ./php/xdebug-default.ini /home/xdebug/xdebug-default.ini
# COPY ./php/xdebug-off.ini /home/xdebug/xdebug-off.ini
# COPY ./php/xdebug-profile.ini /home/xdebug/xdebug-profile.ini
# COPY ./php/xdebug-trace.ini /home/xdebug/xdebug-trace.ini

# ARG XDEBUG_MODES
# ARG REMOTE_HOST="docker.for.mac.host.internal"
# ARG REMOTE_PORT=9003
# ARG IDE_KEY="docker"

# ENV MODES=$XDEBUG_MODES
# ENV CLIENT_HOST=$REMOTE_HOST
# ENV CLIENT_PORT=$REMOTE_PORT
# ENV IDEKEY=$IDE_KEY

# COPY ./php/fpm-entrypoint.sh /home/fpm-entrypoint
# RUN chmod +x /home/fpm-entrypoint

WORKDIR /var/www

EXPOSE 80

# ENTRYPOINT ["/home/fpm-entrypoint"]
