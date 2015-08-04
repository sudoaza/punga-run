#! /usr/bin/env bash

. config.sh

if [ "$(id -u)" != "0" ]; then
   echo "router.sh: This script must be run as root" 1>&2
   exit 1
fi

# identificar el router
route -n | grep ^0\.0\.0\.0 | grep -Eo "$IPREGEX" | head -n 2 | tail -n 1 > "$ROUTER"
IP=$(head -n 1 "$ROUTER")
nmap -Pn -n --top-ports 1300 --open --max-retries 0 -O -oG - "$IP" 1>> "$ROUTER"

echo `wc -l "$ROUTER"`
