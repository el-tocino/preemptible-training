#!/bin/bash
sleep 1 
cd /home/$USER/TTS/
TCMD="python3 train.py --config_path /home/professorevil/GA/config.json --restore_path /home/professorevil/GA/lates
t/best_model.pth.tar"
RUN_CMD="screen -mdS train  ${TCMD}"
echo "running: $RUN_CMD" >> /home/professorevil/logs/train.log
$RUN_CMD
RESULT=$(echo $?)
echo "Resulted in: $RESULT" >> /home/professorevil/logs/train.log
exit
