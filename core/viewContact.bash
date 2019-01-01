#!/bin/bash

# 1 - array of what to view
# ex. ( Con_ID Con_FN Con_LN ) => ( id firstName lastName )

# TODO DELETE
source "../const/Contact.bh"
shopt -s expand_aliases
alias query='../db/query.bash'
# TODO DELETE

# EX.
# TOVIEW=( $Con_ID $Con_FN $Con_LN )
#
# echo ${#TOVIEW[*]}
TOVIEW=( $@ )
FIELDS=$(echo ${TOVIEW[*]} | tr " " ",")
echo ${TOVIEW[*]}
echo ${FIELDS}

SQL="SELECT ${FIELDS} From Contact;"
query "$SQL" | cut -f1 -d"|" | tr "\t" ":"

exit 0
