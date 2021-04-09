PROJECT_NAME?=unpackker-ui
APP_DIR?=$$(git rev-parse --show-toplevel)
VERSION?=0.0.1

.PHONY: help
help: ## Prints help (only for targets with comments).
	@grep -E '^[a-zA-Z0-9._-]+:.*?## .*$$' ${MAKEFILE_LIST} | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

dependencies.install: ## Installs the dependencies listed.
	npm install

app.lint: ## Lints application for errors.
	npm run lint

app.build: ## Builds app for production.
	npm run build

app.run: app.lint ## Runs the command and serves the request.
	npm run serve

dockerise: docker.lint app.lint ## Containerise the application.
	docker build -t ${DOCKER_USER}/${PROJECT_NAME}:${VERSION} .

docker.lint: ##Lints Dockerfile.
	docker run --rm -v ${APP_DIR}:/app -w /app hadolint/hadolint:latest-alpine hadolint Dockerfile

docker.publish.image: ## Publisies the image to the registered docker registry.
	docker push ${DOCKER_USER}/${PROJECT_NAME}:${VERSION}

docker.login: ## Establishes the connection to the docker registry.
	docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWD} ${DOCKER_REPO}