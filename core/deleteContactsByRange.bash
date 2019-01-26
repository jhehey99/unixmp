#!/bin/bash
shopt -s expand_aliases
alias log="$PWD/util/log.bash"

# 1 - list of ids to delete, comma separated

IDRANGE="$1"

TODELETE=$(echo "$IDRANGE" | sed "s/-/ and /")

SQL="DELETE FROM Contact WHERE ID between $TODELETE";

# echo "$SQL"

if query.bash "$SQL"; then
    log "Contacts Successfully Deleted..."
    exit 0
fi

log "Delete Contacts Failed..."
exit 1
