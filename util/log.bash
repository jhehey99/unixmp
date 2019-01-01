#!/bin/bash

# Usage : log "string"
# File  : */mp/etc/.logs

if [ -f "$LOGFILE" ]; then
    # TODO - ADD date and time of log
    # "[DATETIME]:MSG"
    echo "$1" >> $LOGFILE
fi

exit 0
