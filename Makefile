all: up

up:
	@mkdir -p ${HOME}/data
	@mkdir -p ${HOME}/data/wordpress
	@mkdir -p ${HOME}/data/mariadb
	@sudo sh -c 'echo "127.0.0.1 lpupier.42.fr" >> /etc/hosts && echo "successfully added lpupier.42.fr to /etc/hosts"'
	@sudo docker compose -f ./srcs/docker-compose.yml up --detach

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down

build:
	@sudo docker compose -f srcs/docker-compose.yml up --detach --build

logs:
	@sudo docker compose -f srcs/docker-compose.yml logs

clean:
	@sudo docker stop nginx wordpress mariadb 2>/dev/null || true
	@sudo docker rm nginx wordpress mariadb 2>/dev/null || true
	@sudo docker volume rm db wp 2>/dev/null || true
	@sudo docker rmi srcs-nginx srcs-wordpress srcs-mariadb 2>/dev/null || true
	@sudo docker network rm inception_net 2>/dev/null || true
	sudo rm -rf ${HOME}/data
	@sudo sed -i '/127.0.0.1 lepupier.42.fr/d' /etc/hosts && echo "successfully removed lpupier.42.fr to /etc/hosts"
	# @docker system prune --all # remove comment will remove every cached docker data 

re: clean all

.PHONY: all up down build clean logs re
