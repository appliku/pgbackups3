#!/usr/bin/env bash
set -e
TIMESTAMP=$(date +%F_%T | tr ':' '-')
TEMP_FILE=$(mktemp tmp.XXXXXXXXXX)
S3_FILE="s3://$BUCKET_NAME/$PREFIX/$PREFIX-backup-$TIMESTAMP"
pg_dump --no-privileges --no-owner --no-acl $URL | gzip > "$TEMP_FILE"
du -h -s "$TEMP_FILE"
aws s3 cp "$TEMP_FILE" "$S3_FILE"
rm "$TEMP_FILE"
if [ -z "$CHECKIN_URL" ]; then
  echo "No check-in URL found."
else
   echo "Sending check-in to $CHECKIN_URL"
   curl "$CHECKIN_URL" &> /dev/null
fi