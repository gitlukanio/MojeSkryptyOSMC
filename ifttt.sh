#!/usr/bin/env bash
###########################################################################
# Originally written by: Henrik Bengtsson, 2014
# https://github.com/HenrikBengtsson/speedtest-cli-extras
# Modified to use IFTTT by: Alasdair Allan, 2015
# License: GPL (>= 2.1) [http://www.gnu.org/licenses/gpl.html]
###########################################################################

# Send to IFTTT
secret_key="ckLidV89I0dklUHEBDhek3"
value1=`echo "$(/opt/vc/bin/vcgencmd measure_temp | cut -d"=" -f2)"`

value2=`echo "$(df -h | grep /dev/root | cut -d" " -f14) pozostalo $(df -h | grep /dev/root | cut -d" " -f12)"`
value3=`echo -e "$(uptime)"`
 
json="{\"value1\":\"${value1}\",\"value2\":\"${value2}\",\"value3\":\"${value3}\"}"
curl -X POST -H "Content-Type: application/json" -d "${json}" https://maker.ifttt.com/trigger/pierwszy/with/key/${secret_key}
  
echo
