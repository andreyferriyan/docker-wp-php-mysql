FROM php:7.1.8-fpm

RUN apt-get update && apt install -y redis-server libjpeg-dev libpng-dev wget unzip iconv mbstring fileinfo xmlreader xmlwriter spl ftp opcache mysqli && docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqli gd zip imagick  \
 && docker-php-ext-enable pdo pdo_mysql mysqli gd zip imagick

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
        && php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
        && php composer-setup.php \
        && php -r "unlink('composer-setup.php');" \
        && apt update && apt install -y less \
        && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /tmp/wp-cli.phar \
        && chmod +x /tmp/wp-cli.phar \
        && mv /tmp/wp-cli.phar /usr/local/bin/wp

RUN php /var/www/html/composer.phar require predis/predis

CMD ["php-fpm"]

EXPOSE 9000
