#! /usr/bin/env bash

. config.sh

# averiguar mi ip local

ifconfig | grep -v "LOOPBACK" | grep -v "vpn" | grep "flags=" -A 1 | grep inet | grep -Eo "$IPREGEX" > "$INTERNAL"

sed '/^$/d' "$INTERNAL" | head -n 2 | tail -n 1 > "${DIR}mask"
sed '/^$/d' "$INTERNAL" | head -n 1 > "${INTERNAL}_t"

mv "${INTERNAL}_t" "$INTERNAL"

echo `wc -l "$INTERNAL"`

# escanear rango local
# TODO usar el mask q ya tenemos

while read line
do
  nmap -Pn -p 21,22,23,80,139,443,445,3306,5000,8000,8080 -n -T5 --open --max-retries 0 -oG - "${line}/24" 1>> "${HOSTS}";
done < "$INTERNAL"

echo `wc -l "$HOSTS"`
