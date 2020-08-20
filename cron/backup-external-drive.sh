#!/bin/bash
# find out drive id with lsusb
DRIVE_ID='0bc2:231a'
MOUNT_POINT='/media/lukas/Seagate\ Expansion\ Drive'
LOG_FILE='/tmp/backup_log.txt'
COUNTER=0

while [ $(lsusb -d $DRIVE_ID | wc -l) -eq 0 ]
do
        notify-send 'Attention!' 'Please insert hard drive for backup!'
        sleep 30
	COUNTER=$(($COUNTER+1))
	if [ $COUNTER -gt 5 ]
	then 
		notify-send 'Backup to external hard drive failed.' 'After several attempts, still no hard drive connected.'
		exit 1
	fi
done
notify-send 'Back up to external drive is starting now...'
rsync -avP ${HOME}/Documents "${MOUNT_POINT}" 2> ${LOG_FILE} 

# check if there occurred an error
if [ $(du ${LOG_FILE} | awk '{print $1}') -gt 0 ]
then
	notify-send 'An error occurred!'
	xdg-open ${LOG_FILE}
fi
