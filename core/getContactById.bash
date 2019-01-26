#!/bin/bash

shopt -s expand_aliases
alias log="$PWD/util/log.bash"

# 1 - ID of contact to get
ID="$1"
SQL="SELECT * FROM Contact WHERE id = ${ID};"

if query.bash "$SQL" | cut -f1 -d"|" | tr "\t" ":"; then
    log -q "Contacts Successfully Obtained..."
    exit 0
fi

log -q "Get Contacts Failed..."
exit 1
