#!/bin/bash

#  curl -s nsanamegenerator.com | tail -2 | head -1 | cut -f 1 -d "<"

while [ 1 ]
do
# echo -e "$(date +%F_%T) -- "
tmp=$(curl -s nsanamegenerator.com | tail -2 | head -1 | cut -f 1 -d "<")
 echo -e "$(date +%F_%T) -- $tmp"


 sleep 2
done
