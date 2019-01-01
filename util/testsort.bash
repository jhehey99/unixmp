#!/bin/bash

TMPFILE="../var/tmp/tmp_sort.txt"
# echo -n > "$TMPFILE"
#
# NUM=20
#
# for i in $(seq 0 $NUM); do
#     openssl rand -base64 24 >> "$TMPFILE"
# done

# cat "$TMPFILE"
sort.bash "$TMPFILE"



exit 0
