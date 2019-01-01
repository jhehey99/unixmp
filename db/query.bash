#!/bin/bash

source ".db.conf"

# First Argument is the sql statement
SQL="$1"
if mysql -u"$DBUSER" -p"$DBPASS" -e "USE ${DBNAME}; ${SQL};"; then
    exit 0
fi

exit 1
