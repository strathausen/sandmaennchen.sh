#!/bin/bash

domain="http://www.sandmaennchen.de"
popup="$domain$(echo `curl $domain \
  | grep videoUrl \
  | sed 's/var videoUrl = "\([^"]*\).*/\1/'` | tr -d ' ')"

echo "Opening popup $popup"
medialink=`curl $popup \
  | grep http-stream \
  | sed "s/'file': '\([^']*\).*/\1/"`
echo "Found media link $medialink"

wget $medialink
