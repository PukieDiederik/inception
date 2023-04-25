FROM alpine:3.16

EXPOSE 3306

ARG DB_NAME
ARG DB_ADMIN_PASS
ARG WP_DB_USER
ARG WP_DB_PASS

# install dependencies for wordpress
RUN apk update && apk upgrade
RUN apk add mariadb mariadb-server-utils

COPY mariadb.conf /etc/mysql/my.cnf

# setup mariadb user
RUN adduser mysql mysql
RUN chown -R mysql:mysql /var/lib/mysql

# setup place for socket file
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 777 /run/mysqld

# create init file
RUN mysql_install_db --user=mysql --datadir="/var/lib/mysql"
RUN echo -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ADMIN_PASS';\n\
CREATE DATABASE IF NOT EXISTS $DB_NAME;\n\
CREATE USER IF NOT EXISTS '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASS';\n\
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$WP_DB_USER'@'%';\n\
FLUSH PRIVILEGES;\n" > /init.sql
RUN chmod +x /init.sql

CMD ["mysqld", "--user=mysql", "--init-file=/init.sql", "--skip_networking=0"]
