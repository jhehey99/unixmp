#!/bin/bash

shopt -s expand_aliases
alias log="$PWD/util/log.bash"

ID="$1"

# check if ID is INT
DELSQL="DELETE FROM Contact WHERE ID = '${ID}'";
if ! query.bash "$DELSQL"; then
    log "Delete Contact Failed..."
    exit 1
fi

log "Delete Contact Success..."

exit 0
