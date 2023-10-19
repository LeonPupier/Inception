# Main common rule
all:	up

# Mount each docker and run them
up:
	@mkdir -p ${HOME}/data
	@mkdir -p ${HOME}/data/wordpress
	@mkdir -p ${HOME}/data/mariadb
	@sudo sh -c 'echo "127.0.0.1 lpupier.42.fr" >> /etc/hosts && echo "Successfully added lpupier.42.fr to /etc/hosts"'
	@docker compose -f ./srcs/docker-compose.yml up --detach

# Unmount dockers
down:
	@docker compose -f ./srcs/docker-compose.yml down

# Build the dockers
build:
	@docker compose -f srcs/docker-compose.yml up --detach --build

# Clean the dockers installation
clean:
	@docker stop nginx wordpress mariadb 2>/dev/null || true
	@docker rm nginx wordpress mariadb 2>/dev/null || true
	@docker volume rm db wp 2>/dev/null || true
	@docker rmi srcs-nginx srcs-wordpress srcs-mariadb 2>/dev/null || true
	@docker network rm inception_net 2>/dev/null || true
	sudo rm -rf ${HOME}/data
	@sudo sed -i '/127.0.0.1 lpupier.42.fr/d' /etc/hosts && echo "lpupier.42.fr removed in /etc/hosts"

# Purge all cached data of dockers
purge:	down clean
	@docker system prune --all

# Restart the docker build
re: clean all

# Rules
.PHONY: all up down build clean purge re
