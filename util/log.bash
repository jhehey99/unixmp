#!/bin/bash

# Usage : log "string"
# File  : */mp/etc/.logs

if [ $# -eq 2 ]; then
    OPT="$1"
    STR="$2"
else
    STR="$1"
fi

DATETIME=$(date +"%D : %r")
LOGSTR="[$DATETIME] | $STR"

writeLog()
{
    if [ -f "$LOGFILE" ]; then
        echo -e "$LOGSTR" >> $LOGFILE
    fi
}

# default is i-lo-log, then i-echo din.
case "$OPT" in
    -q)
        writeLog
    ;;
    *)
        writeLog
        echo -e "$STR"
    ;;
esac

exit 0
