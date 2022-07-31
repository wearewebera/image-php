# Webera php-fpm Image

Repository used to maintain container image with php-fpm service running
as unprivileged user and listening on port 9000. The image Entrypoint manage
SIGTERM signal correctly to graceful stop the container. To use this image:

    docker run --rm -d -p 9000:9000 webera/php

This image work together with [Apache
image](https://github.com/wearewebera/image-apache):

    docker network create --driver bridge web-server
    docker run --rm -d -p 9000:9000 --network web-server --name php webera/php
    docker run --rm -d -p 8080:8080 --network web-server webera/apache

[See on Docker HUB.](https://hub.docker.com/r/webera/php)
