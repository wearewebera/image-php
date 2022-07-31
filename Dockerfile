FROM webera/base
ENV HOME=/var/www/public_html
COPY assets/build.sh /bin
RUN /bin/build.sh && rm /bin/build.sh
USER www-data 
WORKDIR ${HOME}
EXPOSE 9000
ENTRYPOINT ["/usr/sbin/php-fpm" , "--fpm-config", "/etc/php/php-fpm.conf", "--nodaemonize"]
