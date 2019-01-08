#!/bin/bash

echo "HELLO - ADD CONTACT"

FN="$1"
MN="$2"
LN="$3"
SX="$4"
PN="$5"
EA="$6"
AD="$7"
CT="$8"
ZP="$9"

# Date now
NOW=$(date +"%F")

shopt -s expand_aliases
alias query='query.bash'

SQL="INSERT INTO Contact(firstName, middleName, lastName, sex, phone, email, address, city, zipCode, dateAdded)
     VALUES ('${FN}', '${MN}', '${LN}', '${SX}', '${PN}', '${EA}', '${AD}', '${CT}', '${ZP}', '${NOW}');"

if query "$SQL"; then
    echo "Insert Contact Success..."
    exit 0
fi

echo "Insert Contact Failed..."
exit 1
