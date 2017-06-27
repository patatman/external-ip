#!/bin/bash

# Configuration variables
# A api can be found over at https://pushbullet.com
externip=$(/bin/curl icanhazip.com)
ipfile=/var/externip
oldip=$(cat $ipfile)
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
  -d body="Old ip: $oldip, new ip: $externip" \
  -X POST
  echo "$externip" > $ipfile
fi
