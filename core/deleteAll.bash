#!/bin/bash

shopt -s expand_aliases
alias log="$PWD/util/log.bash"

if [ "$1" = "-q" ]; then
    alias log="$PWD/../util/log.bash"
fi

DELSQL="DELETE FROM Contact";
if ! query.bash "$DELSQL"; then
    log "Delete All Failed..."
    exit 1
fi

log "Delete Contact Success..."

exit 0
