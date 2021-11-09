# meltano-docker

## How to create this directory
```
pip install -r requirements.txt
meltano init <dir-name>
```

## Database
Create a Postgres database somewhere on the cloud. Allow access from any IP and note user settings (must be fully priveleged, probably the `postgres` user).

## Run Meltano UI
To test the database connection.
```
export MELTANO_DATABASE_URI=postgresql://<user>:<password>@<host>:<port>/<db>
meltano ui
```

## Deploy to the cloud
Update the Dockerfile with the DB connection (needed during image creation and running).
```
ENV MELTANO_DATABASE_URI=postgresql://<user>:<password>@<host>:<port>/<db>
```

And deploy to the cloud:
```
gcloud builds submit . --tag=gcr.io/<project>/<image-name>
gcloud run deploy <run-name> \
  --image=gcr.io/<project>/<image-name> \
  --region=europe-west4 \
  --allow-unauthenticated
```
