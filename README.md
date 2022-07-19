# Postgres Database and upload it to S3

```
docker run -e PREFIX=your_app_name -e AWS_ACCESS_KEY_ID=your_key_id -e AWS_SECRET_ACCESS_KEY=yoursecret -e AWS_DEFAULT_REGION=eu-central-1 -e BUCKET_NAME=bucketname -e URL=postgres://user:password@host:port/dbname -e SLEEP=43200 kpavlovsky/pgbackups3:latest
```


You can also set check-in URL to ping your server after backup is done.

```
CHECKIN_URL=http://your.server.com/ping
``` 


## Building and Pushing

```
docker build -t kpavlovsky/pgbackups3:latest .
docker push kpavlovsky/pgbackups3:latest
```