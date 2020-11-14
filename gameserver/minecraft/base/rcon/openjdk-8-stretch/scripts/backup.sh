#!/bin/bash

MAX_BACKUP_COUNT=10

function after_finish {
    COUNT=$(( $(ls /backups/ -l | wc -l) - 1))
    if [ $COUNT -gt $MAX_BACKUP_COUNT ]; then
        OLDEST=$(ls -1 -lt /backups | awk ' /^-/ { print $9 }' | tail -1 | xargs printf -- '/backups/%s')
        rm -f $OLDEST &&\
            echo "[INFO] [BACKUPS] Deleted oldest backup archive ($OLDEST)"
    fi
}


[ -x $SKIP_BACKUPS ] || {
    echo "[INFO] [BACKUP] Skipping backups (\$SKIP_BACKUPS='$SKIP_BACKUPS')"
    exit 0
}

rconcli --properties /mc/server.properties \
    --auto-reconnect --rcon-encoding cp1252 --silent \
    save-all || {

    echo "[ERROR] [BACKUP] failed saving world"
}

sleep 5

BACKUP_NAME="backup_$(date +%y-%m-%d-%H-%M-%S)"
BACKUP_LOC="/backups/$BACKUP_NAME.tar.gz"

echo "[INFO] [BACKUP] initializing backup..."

tar -C /mc --warning=no-file-changed -czf $BACKUP_LOC . && {
    echo "[INFO] [BACKUP] backup finished ($BACKUP_LOC)"
    after_finish
} || {
    echo "[ERROR] [BACKUP] backup failed"
}

