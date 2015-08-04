#! /usr/bin/env bash

. config.sh

if [ "$(id -u)" != "0" ]; then
   echo "routes.sh: This script must be run as root" 1>&2
   exit 1
fi

nmap -traceroute -p 80 -n --max-retries 0 200.51.211.7 >> "$ROUTES"
nmap -traceroute -p 80 -n --max-retries 0 200.45.191.35 >> "$ROUTES"

echo `wc -l "$ROUTES"`
