FROM mambaorg/micromamba:0.15.3

RUN micromamba install -y -n base python=3.8.10 mlflow=1.20.2 -c conda-forge
RUN micromamba install -y -n base psycopg2=2.8.5 boto3=1.16.0 -c anaconda
RUN micromamba clean --all --yes

COPY ./entrypoint.sh /scripts/

EXPOSE 80/tcp

CMD ["/scripts/entrypoint.sh"]