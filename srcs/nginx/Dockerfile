FROM alpine:3.16

expose 443

# install dependencies for nginx
RUN apk update && apk upgrade
# need nginx and openssl for generating the ssl certificate
RUN apk add nginx openssl

# configure SSL
# req - says we want to create or process a certificate
# x509 - refers to what standard of certificate, in this case RFC 5280
# sha256 - says we want to has using sha256
# nodes - not password protected
# subj - will setup destinguished name
# days - how many days this certificate will be valid for
# newkey - format of the key, in this case RSA with 4096 bit encryption
# keyout - where the private key will be stored
# out - where the actual certificate will be stored
RUN openssl req -x509 -sha256 -nodes -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisboa/CN=drobert-" -days 365 -newkey rsa:4096 -keyout /etc/ssl/nginx_ss.key -out /etc/ssl/nginx_ss.crt

# copy nginx config file
COPY nginx.conf /etc/nginx/nginx.conf

# starts nginx as a normal program instead of a daemon
CMD ["nginx", "-g", "daemon off;"]
