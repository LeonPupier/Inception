# Version
FROM		debian:buster

# Install services
RUN		apt update			-y
RUN		apt upgrade			-y
RUN		apt-get install mariadb-server	-y

# MariaDB configuration
COPY		conf/mariadb_conf.sh .
RUN		chmod +x mariadb_conf.sh

# Open port
EXPOSE		3306

# Start
ENTRYPOINT	["./mariadb_conf.sh"]
CMD		["mysqld", "--bind-address=0.0.0.0"]
