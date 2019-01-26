#!/bin/bash
shopt -s expand_aliases
alias log="$PWD/util/log.bash"

# 1 - list of ids to delete, comma separated

IDSTODELETE="$1"

# echo "$IDSTODELETE"

SQL="DELETE FROM Contact WHERE ID in (${IDSTODELETE})";

# echo "$SQL"

if query.bash "$SQL"; then
    log "Contact Successfully Deleted..."
    exit 0
fi

log "Delete Contact Failed..."
exit 1
