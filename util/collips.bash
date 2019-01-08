#!/bin/bash

NCHAR="$1"

# TMPVIEW="../var/tmp/tmp_view.txt"

SUF="..."
NSUF=${#SUF}

# pag mahaba ung line, papaiksiin lng palitan ng ellipsis dulo para pantay
while read LINE; do

    if [ ${#LINE} -gt $NCHAR ]; then
        NLINE=${#LINE}
        (( NEXCESS = $NLINE - $NCHAR  ))
        (( END = $NLINE - $NEXCESS))

        STR=${LINE:0:$END}

        echo "${STR:0: -$NSUF}$SUF"
    else
        echo "$LINE"
    fi

done < "$TMPCOLLIPS"

exit 0
