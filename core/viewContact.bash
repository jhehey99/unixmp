#!/bin/bash

# 1 - array of what to view
# ex. ( Con_ID Con_FN Con_LN ) => ( id firstName lastName )

shopt -s expand_aliases
alias log="$PWD/util/log.bash"

TOVIEW=( $@ )
FIELDS=$(echo ${TOVIEW[*]} | tr " " ",")

SQL="SELECT ${FIELDS} From Contact;"
query.bash "$SQL" | cut -f1 -d"|" | tr "\t" ":"

exit 0
