containerName = "inception"

COMPOSE_PROJECT_NAME = Inception

DOCKER_COMPOSE_FILE := /home/kali/Documents/inception/srcs/docker-compose.yml

DOCKER_COMPOSE := docker-compose -f 

all:
	@echo "Launching containers from project $(COMPOSE_PROJECT_NAME)..."
	$(DOCKER_COMPOSE) $(DOCKER_COMPOSE_FILE) up -d --build
	@echo "\n\n"
	@docker ps
	@echo "\n"

start:
	@echo "Starting containers from $(COMPOSE_PROJECT_NAME)..."
	$(DOCKER_COMPOSE) $(DOCKER_COMPOSE_FILE) start
	@echo "\n\n"
	@docker ps
	@echo "\n"

stop:
	@echo "Stopping containers from $(COMPOSE_PROJECT_NAME)..."
	$(DOCKER_COMPOSE) $(DOCKER_COMPOSE_FILE) stop
	@echo "\n\n"
	@docker ps
	@echo "\n"

prune:
	$(DOCKER_COMPOSE) $(DOCKER_COMPOSE_FILE)  down --v
	@docker system prune -af
	@echo "\n\n"
	@docker ps
	@echo "\n"

clean:
	$(DOCKER_COMPOSE) $(DOCKER_COMPOSE_FILE) down --v
	@docker system prune -af
	@sudo rm -rf /home/kali/data/mariadb/* /home/kali/data/wordpress/* 

.PHONY: all start prune stop clean