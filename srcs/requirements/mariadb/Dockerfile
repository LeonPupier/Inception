# Version
FROM		debian:buster

# Install services
RUN		apt update			-y
RUN		apt upgrade			-y
RUN		apt-get install mariadb-server	-y

# MariaDB configuration
COPY		conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY		conf/mariadb_conf.sh /mariadb_conf.sh
ENTRYPOINT	["bash", "mariadb_conf.sh"]
