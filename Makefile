.PHONY: docker/build docker/push

MLFLOW_REPO=elemenoai/mlflow

docker/build:
	DOCKER_BUILDKIT=1 docker build -t ${MLFLOW_REPO}:latest \
		-t ${MLFLOW_REPO}:$(VERSION) .

docker/push:
	DOCKER_BUILDKIT=1 docker push ${MLFLOW_REPO}:$(VERSION)
	DOCKER_BUILDKIT=1 docker push ${MLFLOW_REPO}:latest