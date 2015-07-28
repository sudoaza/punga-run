#! /usr/bin/env bash

. config.sh

if [ "$(id -u)" != "0" ]; then
   echo "routes.sh: This script must be run as root" 1>&2
   exit 1
fi

nmap -traceroute -p 80 telecom.com.ar >> "$ROUTES"
nmap -traceroute -p 80 telefonica.com.ar >> "$ROUTES"

echo `wc -l "$ROUTES"`
