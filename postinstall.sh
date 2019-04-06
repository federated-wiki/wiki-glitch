#!/bin/bash
mkdir -p .data/status .data/assets
readonly ICON=.data/status/favicon.png
[ -f $ICON ] || {
  node random-favicon.js
  cp /app/default-data/* node_modules/wiki-server/default-data/pages
}
