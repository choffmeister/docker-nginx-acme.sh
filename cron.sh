#!/bin/sh

sleep 10
while true; do
    /opt/acme.sh/acme.sh --cron
    # make nginx reload
    kill -s HUP 1
    sleep 3600
done
