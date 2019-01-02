#!/bin/bash

# Compares two strings
# Options
# -a = ascending
# -d = descending


OP="$1"
S1="$2"
S2="$3"

case $OP in
    -a)
        if [[ "$S1" < "$S2" ]]; then
            echo "$S1"
        else
            echo "$S2"
        fi
    ;;
    -d)
        if [[ "$S1" > "$S2" ]]; then
            echo "$S1"
        else
            echo "$S2"
        fi
    ;;
    *)
        echo "Specify Order (-a / -d) (Ascending / Descending)..."
        exit 1
    ;;
esac

exit 0
