FROM drupal:10.5.8-php8.3-apache

WORKDIR /var/www/html

COPY php.ini /usr/local/etc/php/conf.d/php.ini

COPY settings.php /var/www/html/sites/default/settings.php

RUN chown www-data:www-data /var/www/html/sites/default/settings.php && \
    chmod 444 /var/www/html/sites/default/settings.php

RUN mkdir -p sites/default/files/config/sync \
    && chown -R www-data:www-data sites/default/files \
    && chmod -R 755 sites/default/files
    
RUN composer require drush/drush --no-interaction
RUN composer require drupal/s3fs --no-interaction



