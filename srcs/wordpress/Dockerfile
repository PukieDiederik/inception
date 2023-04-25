FROM alpine:3.16

expose 9000

ARG DB_NAME
ARG WP_DB_USER
ARG WP_DB_PASS


# install dependencies for wordpress
RUN apk update && apk upgrade
RUN apk add curl
# RUN apk add --no-cache \
#             --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
# 			php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo\
# 			php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml
RUN	apk update && apk upgrade && apk add --no-cache \
		mariadb-client	\
		# Wordpress core depencencies
		fcgi			\
		php				\
		php-phar		\
		php-fpm			\
		php-common		\
		php-session		\
		php-iconv		\
		php-json		\
		php-gd			\
		php-curl		\
		php-xml			\
		php-mysqli		\
		php-imap		\
		php-cgi			\
		php-pdo			\
		php-pdo_mysql	\
		php-soap		\
		php-posix		\
		php-gettext		\
		php-ldap		\
		php-ctype		\
		php-dom			\
		php-simplexml

# install wordpress cli
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN mkdir -p /var/www/wordpress && chown root /var/www/wordpress

# Install and configure wordpress
RUN wp core download --allow-root --path="/var/www/wordpress"
RUN wp config create --dbname="$DB_NAME" --dbuser="$WP_DB_USER" --dbpass="$WP_DB_PASS" --dbhost="mariadb:3306" --path="/var/www/wordpress" --skip-check --allow-root

# Create fpm user
RUN addgroup -S phpfpm && adduser -S -G phpfpm phpfpm

# Copy files over
COPY php-fpm.conf /etc/php8/php-fpm.conf
COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh"]
