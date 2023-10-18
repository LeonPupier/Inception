# Version
FROM	debian:buster

# Open the port
EXPOSE	443

# Install services
RUN	apt update
RUN	apt install nginx	-y
RUN	apt install vim		-y
RUN	apt install curl	-y

# Install OpenSSL and generate a certificate
RUN	mkdir -p /etc/nginx/ssl
RUN	apt install openssl	-y
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=lpupier.42.fr/UID=lpupier"

# Create the configuration folder of Nginx
RUN	mkdir -p /var/run/nginx
COPY	conf/nginx.conf etc/nginx/nginx.conf

# Server configuration
RUN	chmod 755 /var/www/html
RUN	chown -R www-data:www-data /var/www/html

# Start Nginx
CMD	["nginx", "-g", "daemon off;"]
