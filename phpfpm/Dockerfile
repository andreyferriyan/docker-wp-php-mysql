FROM php:7.1.8-fpm

ARG INSTALL_XDEBUG=true
ENV INSTALL_XDEBUG ${INSTALL_XDEBUG}
RUN if [ ${INSTALL_XDEBUG} = true ]; then \
    pecl install xdebug && \
    docker-php-ext-enable xdebug \
;fi

RUN apt-get update && apt-get install -y libz-dev libmemcached-dev libjpeg-dev libpng-dev \
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqli gd \
    && docker-php-ext-enable pdo pdo_mysql mysqli gd

RUN docker-php-ext-install zip \
    && docker-php-ext-enable zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
	&& php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
	&& php composer-setup.php \
	&& php -r "unlink('composer-setup.php');" \
	&& apt update && apt install -y less \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /tmp/wp-cli.phar \
	&& chmod +x /tmp/wp-cli.phar \
	&& mv /tmp/wp-cli.phar /usr/local/bin/wp


CMD ["php-fpm"]

EXPOSE 9000
