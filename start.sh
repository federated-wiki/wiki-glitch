#!/bin/bash
which jq > /dev/null || sudo apt update && sudo apt install -y jq
[ "" == "$PORT" ] && PORT="8080"
[ "" == "$COOKIE_SECRET" ] && COOKIE_SECRET="adfjlk23u909djfoi30adfjl0329ajdf"
[ "" == "$PASSWORD" ] && PASSWORD="local testing password"
URL=https://$PROJECT_NAME.glitch.me
[ "" == "$PROJECT_NAME" ] && URL=https://localhost/
WIKI=wiki
which wiki || WIKI=./node_modules/.bin/wiki
jq -n \
  --arg owner "$OWNER" \
  --arg secret "$PASSWORD" \
  '{"name": $owner, "friend": {"secret": $secret}}' \
  > .data/status/owner.json
$WIKI \
  -p $PORT \
  -u $URL \
  --admin="$PASSWORD" \
  --secure_cookie=true \
  --cookieSecret="$COOKIE_SECRET" \
  --client='node_modules/wiki-client/client' \
  --data='.data' \
  --packageDir='/app/node_modules' \
  --security_type='friends'
