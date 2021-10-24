# ELabs MLflow Docker

Docker release for production ready MLflow serving.

### How to run locally

1. You will need a postgres instance to use as the repository for MLflow data. If you're running just for testing, you can start postgres docker container locally with `docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres:9.6.23-alpine3.14`
2. You need to also have a distributed persistence in order to retrieve artifacts. If you can't use a managed service, like AWS S3, we recommend you run minio locally with: `docker run -p 9000:9000 -d minio/minio:RELEASE.2021-10-13T00-23-17Z server /data`
3. Start ML flow with: `docker run -e BACKEND_STORE_URI=postgresql://postgres:mysecretpassword@host.docker.internal:5432/postgres -e DEFAULT_ARTIFACT_ROOT=s3://mlflow/ -e MLFLOW_S3_ENDPOINT_URL=host.docker.internal:9000 -e AWS_ACCESS_KEY_ID=minio -e AWS_SECRET_ACCESS_KEY=minio123 -p 80:80 elemenoai/mlflow`. Now you can just open your browser and type http://localhost

### Additional instructions

Mandatory ENV VARS:

- BACKEND_STORE_URI: Database connection formatted as db-type://user:password@host:port/database   
ie: postgresql://user:secret@localhost:5432/mlflow
- DEFAULT_ARTIFACT_ROOT: Default artifact location ie: s3://mlflow/   
Note: Bucket must exist before running.
- MLFLOW_S3_ENDPOINT_URL: MinIO url.
- AWS_ACCESS_KEY_ID: S3/AWS access key or MinIO username.
- AWS_SECRET_ACCESS_KEY: S3/AWS secret key or MinIO password.

### Running on Kubernetes

We recommend use this [helm chart](https://github.com/cetic/helm-mlflow) for k8s environments,   
just change the key **image.repository** in the values.yaml to elemenoai/mlflow:0.0.1.
