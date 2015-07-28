#! /usr/bin/env bash

DIR='/tmp/punga/'
if [ ! -d "$DIR" ]; then
  mkdir "$DIR"
fi
IPREGEX='[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
INTERNAL="${DIR}internal"
EXTERNAL="${DIR}external"
ROUTES="${DIR}routes"
ROUTER="${DIR}router"
HOSTS="${DIR}hosts"
echo "" > "$HOSTS"
echo "" > "$EXTERNAL"
echo "" > "$INTERNAL"
echo "" > "$ROUTES"
echo "" > "$ROUTER"
