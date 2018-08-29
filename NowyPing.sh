#!/bin/bash
ping $1 | while read pong; do echo "$(date +%F_%T) -- $pong"; done


