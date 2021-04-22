#!/usr/bin/env bash

set -a
source .env
# set +a

read -r -d '' applescriptCode <<'EOF'
  set dialogText to text returned of (display dialog "請輸入 redmine 票號" default answer "")
  return dialogText
EOF

dialogText=$(osascript -e "$applescriptCode");

if [ "${dialogText}" ]
then
  curl -k -v -d "<?xml version="1.0"?>
  <time_entry>
    <project_id>${PROJECT_ID}</project_id>
    <issue_id>${dialogText}</issue_id>
    <hours>7</hours>
    <activity_id>9</activity_id>
    <comments>評估 or 開發</comments>
    <user_id>${USER_ID}</user_id>
  </time_entry>" -H 'Content-Type: application/xml' -X POST -H "X-Redmine-API-Key: ${REDMINE_APIKEY}" "${REDMINE_HOST}/time_entries.xml"
fi

# note:
# curl -k 不檢查 ssl, -v 將過程中經過的訊息印在畫面上, -L 自動轉址
