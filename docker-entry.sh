#!/bin/sh

/opt/acme.sh/acme.sh $@
/cron.sh &
exec nginx -g "daemon off;"
