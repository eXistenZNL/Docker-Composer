FROM existenz/base

MAINTAINER docker@stefan-van-essen.nl

RUN apk -U add git php-cli php-json php-phar php-openssl php-zip subversion && \
    rm -rf /var/cache/apk/* && \
    wget http://getcomposer.org/composer.phar -O /app/composer.phar

# Remove this user and group because they use ID 1000 and thus collide with runas
RUN deluser svn && delgroup svnusers

WORKDIR /cwd

ENTRYPOINT ["runas", "/usr/bin/php", "/app/composer.phar", "--ansi"]
