# Version
FROM		debian:buster

# Install services
RUN		apt-get update
RUN		apt-get upgrade
RUN		apt-get -y install wget
RUN		apt-get install -y php7.3\
		php-fpm\
		php-mysql\
		mariadb-client

# Install WordPress
RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress

# Install the CLI of WordPress for auto configuration
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp

# Start WordPress
COPY		conf/auto_config.sh auto_config.sh
ENTRYPOINT	["bash", "auto_config.sh"]
