#! /usr/bin/env bash

. config.sh

# averiguar mi ip publica

for i in 1 2
do
  curl -m 2 -s http://ipv4bot.whatismyipaddress.com | grep -Eo "$IPREGEX" >> "$EXTERNAL"
  curl -m 2 -s http://ipecho.net/plain | grep -Eo "$IPREGEX" >> "$EXTERNAL"
  curl -m 2 -s http://checkip.dyndns.org | grep -Eo "$IPREGEX" >> "$EXTERNAL"
  curl -m 2 -s http://observebox.com/ip | grep -Eo "$IPREGEX" >> "$EXTERNAL"
done

echo `wc -l "$EXTERNAL"`
sort "$EXTERNAL" | uniq | sed '/^$/d' > "${EXTERNAL}_t"

mv "${EXTERNAL}_t" "$EXTERNAL"

# escanear ip publica

while read line
do
  nmap -Pn --top-ports 100 --open --max-retries 0 -oG - "${line}" 1>> "${ROUTER}";
done < "$EXTERNAL"

echo `wc -l "$HOSTS"`
