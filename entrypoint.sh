#!/bin/sh

set -e

echo

[ -z "$BACKEND_STORE_URI" ]      &&  echo "BACKEND_STORE_URI env var must be set."      && exit 1  || :
[ -z "$DEFAULT_ARTIFACT_ROOT" ]  &&  echo "DEFAULT_ARTIFACT_ROOT env var must be set."  && exit 1  || :
[ -z "$MLFLOW_S3_ENDPOINT_URL" ] &&  echo "MLFLOW_S3_ENDPOINT_URL env var must be set." && exit 1  || :
[ -z "$AWS_ACCESS_KEY_ID" ]      &&  echo "AWS_ACCESS_KEY_ID env var must be set."      && exit 1  || :
[ -z "$AWS_SECRET_ACCESS_KEY" ]  &&  echo "AWS_SECRET_ACCESS_KEY env var must be set."  && exit 1  || :

echo "Starting mlflow server."

mlflow server \
    --backend-store-uri ${BACKEND_STORE_URI} \
    --host 0.0.0.0 \
    --port 80 \
    --default-artifact-root ${DEFAULT_ARTIFACT_ROOT}