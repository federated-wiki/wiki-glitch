#!/bin/bash
mkdir -p .data/status .data/assets
readonly ICON=.data/status/favicon.png
[ -f $ICON ] || {
  node random-favicon.js
  DEFAULT_DATA = /app/default-data
  [ -d $DEFAULT_DATA ] || DEFAULT_DATA = default-data
  cp $DEFAULT_DATA/* node_modules/wiki-server/default-data/pages
}
