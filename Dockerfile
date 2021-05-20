FROM "gcr.io/webera/base:latest"

RUN apt-get update  \
  && apt-get install -y \
    ca-certificates \
    less \
    vim \
    curl \
    git \
    php-fpm \
    php-common \
    php-mysql \
    php-xmlrpc \
    php-curl \
    php-gd \
    php-imagick \
    php-dev \
    php-imap \
    php-mbstring \
    php-soap \
    php-zip \
    php-bcmath \
    php-xml \
    php-intl \
    php-cli \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME=/var/www/public_html

RUN mkdir -p /run/php; chown www-data:www-data /run/php \
    && mkdir -p ${HOME}; chown www-data:www-data ${HOME} \
    && touch /var/log/php7.4-fpm.log; chown www-data:www-data /var/log/php7.4-fpm.log \
    && ln -s /usr/sbin/php-fpm* /usr/sbin/php-fpm \
    && mkdir -p /var/cache/php; chown www-data:www-data /var/cache/php


# TODO: create a separated image for wp-cli
ADD  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/bin/wp
RUN chmod 0755 /usr/bin/wp

USER www-data

WORKDIR ${HOME}

STOPSIGNAL SIGQUIT

EXPOSE 9000

CMD ["/usr/sbin/php-fpm" , "-y", "/etc/php/7.4/fpm/php-fpm.conf"]
