#!/bin/bash
jq -n \
  --arg owner "$OWNER" \
  --arg secret "$PASSWORD" \
  '{"name": $owner, "friend": {"secret": $secret}}' \
  > .data/status/owner.json
wiki \
  -p $PORT \
  -u https://$PROJECT_NAME.glitch.me \
  --admin="$PASSWORD" \
  --secure_cookie=true \
  --cookieSecret="$COOKIE_SECRET" \
  --client='node_modules/wiki-client/client' \
  --data='.data' \
  --packageDir='/app/node_modules' \
  --security_type='friends'