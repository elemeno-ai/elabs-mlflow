from random import random, randint
from sklearn.ensemble import RandomForestRegressor

import mlflow
import mlflow.sklearn
import os
os.environ['MLFLOW_S3_ENDPOINT_URL'] = "http://your.minio-or-s3.domain"
os.environ['AWS_ACCESS_KEY_ID'] = "yourAccessKeyOrMinioUser"
os.environ['AWS_SECRET_ACCESS_KEY'] = "yourSecretKeyOrMinioPassword"

mlflow.set_tracking_uri("http://your.mlflow.domain")
experiment_name = "mlflow-test"

try:
    experiment_id = mlflow.create_experiment(name=experiment_name)
except:
    experiment_id = mlflow.get_experiment_by_name(name=experiment_name).experiment_id

with mlflow.start_run(experiment_id=experiment_id) as run:
    params = {"n_estimators": 5, "random_state": 42}
    sk_learn_rfr = RandomForestRegressor(**params)

    # Log parameters and metrics using the MLflow APIs
    mlflow.log_params(params)
    mlflow.log_param("param_1", randint(0, 100))
    mlflow.log_metrics({"metric_1": random(), "metric_2": random() + 1})

    # Log the sklearn model and register as version 1
    mlflow.sklearn.log_model(
        sk_model=sk_learn_rfr,
        artifact_path="sklearn-model",
        registered_model_name="test_model"
    )

    mlflow.log_artifact(local_path = './entrypoint.sh')