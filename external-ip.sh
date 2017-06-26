#!/bin/bash

#configuration variables
externip=$(/bin/curl icanhazip.com)
ipfile=/var/externip
pushapi=your pushbullet api


touch $ipfile
cat $ipfile > fileip
echo "$externip" > currentip

DIFF=$(diff fileip currentip)
if [ "$DIFF" != "" ]
then
  curl https://api.pushbullet.com/v2/pushes \
  -u $pushapi: \
  -d type="note" \
  -d title="External ip modified" \
  -d body=$externip \
  -X POST
  echo "$externip" > $ipfile
fi
