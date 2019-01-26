#!/bin/bash

# 1 - 1st arg is file
shopt -s expand_aliases
alias log="$PWD/util/log.bash"

FILE="$1"

VALUES=$(cat "$FILE")

SQL="INSERT INTO Contact(firstName, middleName, lastName, sex, phone, email, address, city, zipCode, dateAdded)
     VALUES ${VALUES}"

 if query.bash "$SQL"; then
     log "Contacts Successfully Added..."
     exit 0
 fi

 log "Add Contacts Failed..."
 exit 1
