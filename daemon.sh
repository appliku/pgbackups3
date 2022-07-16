#!/usr/bin/env bash
set -e
if [ -z "$AWS_ACCESS_KEY_ID" ]; then
   echo -n "AWS_ACCESS_KEY_ID Variable not set. Exiting..."
   exit 1
else
   echo "AWS_ACCESS_KEY_ID is set"
fi
if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
   echo -n "AWS_SECRET_ACCESS_KEY Variable not set. Exiting..."
   exit 1
else
   echo "AWS_SECRET_ACCESS_KEY is set"
fi
if [ -z "$AWS_DEFAULT_REGION" ]; then
   echo -n "AWS_DEFAULT_REGION Variable not set. Exiting..."
   exit 1
else
   echo "AWS_DEFAULT_REGION is set"
fi
if [ -z "$BUCKET_NAME" ]; then
   echo -n "BUCKET_NAME Variable not set. Exiting..."
   exit 1
else
   echo "BUCKET_NAME is set"
fi
if [ -z "$URL" ]; then
   echo -n "URL Variable not set. Exiting..."
   exit 1
else
   echo "URL is set"
fi
if [ -z "$SLEEP" ]; then
   echo -n "SLEEP Variable not set. Exiting..."
   exit 1
else
   echo "SLEEP is set"
fi

if [ -z "$PREFIX" ]; then
   echo -n "PREFIX Variable not set. Exiting..."
   exit 1
else
   echo "PREFIX is set"
fi

while true
do
  bash do_backup.sh
  sleep "$SLEEP"
done
