#!/bin/bash

shopt -s expand_aliases
alias log="$PWD/util/log.bash"


# 1st argument is the filename
FILE="$1"
FILE="randData"

# check if the file is valid
if [ ! -f "$FILE" ]; then
    echo "File $FILE doesn't exist or is not a valid file"
    exit 1
fi

# check if the file has the correct format
# FN:MN:LN:SX:PN:EA:AD:CT:ZP
# May 8 na colon

bash randContact.bash 20

NLINE=$(cat "$FILE" | wc -l)

COLONNUM=8

VALIDLINES=()
INCCOLONS=()
MISSREQ=()


for (( i=1; i<=NLINE; i++)); do

    VALID=true

    # get line
    LINE=$(sed "${i}q;d" "$FILE")

    # pag mali number of colons invalid na sya
    NCOLON=$(echo "$LINE" | grep -o ":" | wc -l)
    if [ $NCOLON -ne $COLONNUM ]; then
        INCCOLONS+=("$i")
        continue
    fi

    # missing required fields
    FN=$(echo "$LINE" | cut -f1 -d:)
    LN=$(echo "$LINE" | cut -f3 -d:)
    if [ -z "$FN" -o -z "$LN" ]; then
        MISSREQ+=("$i")
        continue
    fi

    



    # sa dulo valid na dapat
    if $VALID; then
        VALIDLINES+=("$i")
    fi

done

echo "Incorrect colons: " ${INCCOLONS[*]}
echo "Valid lines: " ${VALIDLINES[*]}




# loop every line
# validate fields
# required 1st and 3rd fields (fn and ln)

# palitan magkasunod na : by its null specifier




#
#
# sed -i "s/$/\')/" "$FILE"
#
# sed -i "s/^/(\'/" "$FILE"
#
# sed -i "s/:/\',\'/g" "$FILE"
#
#
#
# bash randContact.bash 20
#
#
# FILE="randData"
#
# sed -i "s/$/\')/" "$FILE"
#
# sed -i "s/^/(\'/" "$FILE"
#
# sed -i "s/:/\',\'/g" "$FILE"
#
# cat "$FILE"

exit 0































# echo "HELLO - ADD CONTACT"
#
# FN="$1"
# MN="$2"
# LN="$3"
# SX="$4"
# PN="$5"
# EA="$6"
# AD="$7"
# CT="$8"
# ZP="$9"
#
# # Date now
# NOW=$(date +"%F")
#
# SQL="INSERT INTO Contact(firstName, middleName, lastName, sex, phone, email, address, city, zipCode, dateAdded)
#      VALUES ('${FN}', '${MN}', '${LN}', '${SX}', '${PN}', '${EA}', '${AD}', '${CT}', '${ZP}', '${NOW}');"
#
# if query.bash "$SQL"; then
#     log "Contact Successfully Added..."
#     exit 0
# fi
#
# log "Add Contact Failed..."
# exit 1
