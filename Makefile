RM = rm -rf
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all: build up

build:
	docker compose -f $(DOCKER_COMPOSE_FILE) build

up:
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down

clean: down
	docker system prune -af

fclean: clean
	docker volume prune -f

re: fclean all

.PHONY: all build up down clean fclean re