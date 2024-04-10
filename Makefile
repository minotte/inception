containerName = "inception"
isContainerRunning := $(shell docker ps | grep $(containerName) > /dev/null 2>&1 && echo 1)


DOCKER_COMPOSE := docker-compose

build-docker:
	$(DOCKER_COMPOSE) pull --ignore-pull-failures
	$(DOCKER_COMPOSE) build --no-cache

up:
	@echo "Launching containers from project $(COMPOSE_PROJECT_NAME)..."
	$(DOCKER_COMPOSE) up -d
	$(DOCKER_COMPOSE) ps

stop:
	@echo "Stopping containers from project $(COMPOSE_PROJECT_NAME)..."
	$(DOCKER_COMPOSE) stop
	$(DOCKER_COMPOSE) ps

prune:
	@docker-compose down --remove-orphans
	@docker-compose down --volumes
	@docker-compose rm -f
