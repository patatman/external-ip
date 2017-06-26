#!/bin/bash
externip=$(/bin/curl icanhazip.com)
ipfile=/var/externip
touch $ipfile
cat $ipfile > fileip
echo "$externip" > currentip

DIFF=$(diff fileip currentip)
if [ "$DIFF" != "" ]
then
  curl https://api.pushbullet.com/v2/pushes \
  -u [pushbullet api]: \
  -d type="note" \
  -d title="Extern ip thuis gewijzigd" \
  -d body=$externip \
  -X POST
  echo "$externip" > $ipfile
fi
