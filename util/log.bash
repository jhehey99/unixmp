#!/bin/bash

# Usage : log "string"
# File  : */mp/etc/.logs

if [ -f "$LOGFILE" ]; then
    # TODO - ADD date and time of log
    # "[DATETIME]:MSG"
    DATETIME=$(date +"%D : %r")
    echo "[$DATETIME] | $1" >> $LOGFILE
fi

exit 0
