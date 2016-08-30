#/bin/bash
#
#
#

echo "test - `date +%F_%T`" >> /home/osmc/TajneLogiBitBucket/test_`date +%F_%T`.log
git -C /home/osmc/TajneLogiBitBucket/ add . &> /dev/null
git -C /home/osmc/TajneLogiBitBucket/ commit -am "Commit `date +%F_%T`" &> /dev/null
git -C /home/osmc/TajneLogiBitBucket/ push &> /dev/null




