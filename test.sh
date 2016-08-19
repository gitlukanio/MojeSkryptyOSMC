#!/bin/bash

IP="$(echo $SSH_CONNECTION | cut -d " " -f 1)" HOSTNAME=$(hostname) NOW=$(date +"%e %b %Y, %a %r")
KTO=$(whois $IP | grep descr | awk '{print $2, $3, $4, $5, $6, $7, $8, $9, $10}')
#KTO=$(whois $IP | grep descr )
echo -e "Someone from $IP \n$KTO \nlogged into $HOSTNAME on $NOW." | mail -s 'SSH OSMC Login Notification' lukasz.luczko@gmail.com




