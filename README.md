# elabs MLflow

Docker release for production ready Mlflow serving.

Mandatory ENV VARS:

- BACKEND_STORE_URI: Database connection formatted as db-type://user:password@host:port/database   
ie: postgresql://user:secret@localhost:5432/mlflow
- DEFAULT_ARTIFACT_ROOT: Default artifact location ie: s3://mlflow/   
Note: Bucket must exist before running.
- MLFLOW_S3_ENDPOINT_URL: MinIO url.
- AWS_ACCESS_KEY_ID: S3/AWS access key or MinIO username.
- AWS_SECRET_ACCESS_KEY: S3/AWS secret key or MinIO password.

We recommend use this [helm chart](https://github.com/cetic/helm-mlflow) for k8s environments,   
just change the key **image.repository** in the values.yaml to elemenoai/mlflow:0.0.1.