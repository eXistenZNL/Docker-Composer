FROM existenz/base

MAINTAINER docker@stefan-van-essen.nl

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk -U add git php7 php7-json php7-phar php7-openssl php7-zip subversion && \
    rm -rf /var/cache/apk/* && rm -rf /tmp && \
    wget http://getcomposer.org/composer.phar -O /app/composer.phar

# Remove this user and group because they use ID 1000 and thus collide with runas
RUN deluser svn && delgroup svnusers

WORKDIR /cwd

ENTRYPOINT ["runas", "/usr/bin/php7", "/app/composer.phar", "--ansi"]
