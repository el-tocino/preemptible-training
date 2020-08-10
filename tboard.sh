#!/bin/bash
# following sleep command may be useful on startup depending on how long training takes to write its new directory. 
#sleep  15 
cd /home/$USER/LJ/
lastd=$(ls -tr | grep ga-tts | tail -1)
rm -f /home/$USER/LJ/latest && ln -s $lastd latest
cd latest
BCMD="tensorboard --logdir `pwd`"
RUN_CMD="screen -mdS board $BCMD"
$RUN_CMD
