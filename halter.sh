#!/bin/bash
### stop instance if 5 minute load average is under 2, ie, training has hung
INSTANCE=$(gcloud compute instances list | tail -1 | awk ' { print $1} ')
FLA=$(cat /proc/loadavg | awk '  { print $3 } ' | cut -d. -f1)
LFLA=$(cat /home/$USER/logs/5mla )
echo "$FLA" > /home/$USER/logs/5mla
if [[ $FLA -lt 2  &&  $LFLA -lt 2 ]] ; then
        gcloud compute instances stop $INSTANCE
fi
