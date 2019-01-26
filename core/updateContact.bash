#!/bin/bash

shopt -s expand_aliases
alias log="$PWD/util/log.bash"

# $1 - UPDATE STRING
# $2 - ID of contact to update
#
# UPDATE table_name
# SET column1 = value1, column2 = value2, ...
# WHERE condition;

UPDATESTR="$1"
ID="$2"

SQL="UPDATE Contact
     SET ${UPDATESTR}
     WHERE id=${ID}"

if query.bash "$SQL"; then
    log "Contact Successfully Updated..."
    exit 0
fi

log "Update Contact Failed..."
exit 1
