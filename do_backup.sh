#!/usr/bin/env bash
set -e
TIMESTAMP=$(date +%F_%T | tr ':' '-')
TEMP_FILE=$(mktemp tmp.XXXXXXXXXX)
S3_FILE="s3://$BUCKET_NAME/$PREFIX/$PREFIX-backup-$TIMESTAMP"
pg_dump --no-privileges --no-owner --no-acl $URL | gzip > "$TEMP_FILE"
du -h -s "$TEMP_FILE"
aws s3 cp "$TEMP_FILE" "$S3_FILE"