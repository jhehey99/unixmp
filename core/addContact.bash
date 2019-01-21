#!/bin/bash

shopt -s expand_aliases
alias log="$PWD/util/log.bash"

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

SQL="INSERT INTO Contact(firstName, middleName, lastName, sex, phone, email, address, city, zipCode, dateAdded)
     VALUES ('${FN}', '${MN}', '${LN}', '${SX}', '${PN}', '${EA}', '${AD}', '${CT}', '${ZP}', '${NOW}');"

if query.bash "$SQL"; then
    log "Add Contact Success..."
    exit 0
fi

log "Add Contact Failed..."
exit 1
