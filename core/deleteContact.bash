#!/bin/bash

# TODO DELETE
echo "HELLO - DELETE CONTACT"
shopt -s expand_aliases
alias query='../db/query.bash'
# TODO DELETE
source "../const/Contact.bh"

# VIEWSQL="SELECT * FROM Contact;"
#
# if ! query "$VIEWSQL" | cut -f1 -d"|" | tr "\t" ":"; then
#     exit 1
# fi

TOVIEW=( $Con_ID $Con_FN $Con_LN )
echo ${TOVIEW[*]}
./viewContact.bash ${TOVIEW[*]}

echo -n "Enter id of Contact to delete: "
read ID

# check if ID is INT
DELSQL="DELETE FROM Contact WHERE ID = '${ID}'";
if ! query "$DELSQL"; then
    echo "Delete Contact Failed..."
    exit 1
fi

echo "Delete Contact Success..."

#  query.bash "SELECT * FROM Contact;" | cut -f1 -d"|" | tr "\t" ":"

exit 0
