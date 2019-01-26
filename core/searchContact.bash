#!/bin/bash

shopt -s expand_aliases
alias log="$PWD/util/log.bash"

# 1 - field to search
# 2 - what to search

SFIELD="$1"
SVALUE="$2"

SQL="SELECT id,firstName,middleName,lastName,sex,phone,email,address,city,zipCode,dateAdded
 FROM Contact WHERE ${1} = \"${2}\";"

# echo "$SQL"

if query.bash "$SQL" | cut -f1 -d"|" | tr "\t" ":"; then
    log -q "Contacts Successfully Searched..."
    exit 0
fi

log -q "Search Contacts Failed..."
exit 1
