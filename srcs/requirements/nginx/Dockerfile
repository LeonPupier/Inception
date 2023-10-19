# Version
FROM		debian:buster

# Install dependencies
RUN		apt-get update 
RUN		apt-get install nginx	-y
RUN		apt-get install openssl	-y

# Open port
EXPOSE		443

# Copy data to the docker env
COPY		./conf/nginx.conf /etc/nginx/sites-enabled/default
COPY		./tools/nginx_start.sh /var/www
RUN		chmod +x /var/www/nginx_start.sh

# Launch the configuration of Nginx
ENTRYPOINT	["/var/www/nginx_start.sh"]

# Execute Nginx
CMD		["nginx", "-g", "daemon off;"]
