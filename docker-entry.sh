#!/bin/sh

for ARGS in "$@"; do
    /opt/acme.sh/acme.sh $ARGS
done
/cron.sh &
exec nginx -g "daemon off;"
