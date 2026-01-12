FROM drupal:10.4.9-php8.3-apache

COPY settings.php /var/www/html/sites/default/settings.php

RUN chown www-data:www-data /var/www/html/sites/default/settings.php && \
    chmod 444 /var/www/html/sites/default/settings.php