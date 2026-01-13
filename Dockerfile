FROM drupal:10.5.8-php8.3-apache

COPY php.ini-production /usr/local/etc/php/conf.d/php.ini
COPY s3fs-php.ini /usr/local/etc/php/conf.d/s3fs-php.ini

COPY settings.php /var/www/html/sites/default/settings.php
RUN chown www-data:www-data /var/www/html/sites/default/settings.php \
    && chmod 444 /var/www/html/sites/default/settings.php

RUN mkdir -p /var/www/html/sites/default/files/config/sync \
    && chown -R www-data:www-data /var/www/html/sites/default/files \
    && chmod -R 755 /var/www/html/sites/default/files/config/sync

RUN composer require drush/drush drupal/s3fs --no-interaction






