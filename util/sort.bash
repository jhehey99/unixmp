#!/bin/bash


FILE="$1"

# a - ascending, d - descending
ORDER="$2"


# STRS=( $(cat "$FILE") )
#
# for STR in ${STRS[*]}; do
#     echo "$STR"
# done

CONTENT=$(cat "$FILE" | nl | tr "\t" ":")
# echo "$CONTENT"

NLINE=$(( $( echo "$CONTENT" | wc -l)-1 ))
# echo $NLINE

# IDS=$(echo "$CONTENT" | cut -f1 -d":" | tr -d " ")
# echo "$IDS"

STRS=$(echo "$CONTENT" | cut -f2 -d":")
# echo "$STRS"

# ung STRS is ung field which is sorted
# kailangan ng array na each line sa STRS is an element
STARR=()
LNARR=()
for i in $(seq 0 $NLINE); do
    STARR[$i]=$(echo "$STRS" | head -$(($i+1)) | tail -1)
    # LNARR[$i]=$(echo "$IDS" | head -$(($i+1)) | tail -1)
    (( LNARR[$i]=$i+1 ))
    # echo "${STARR[$i]}"
done

# echo "${LNARR[*]}"

# echo ${#STARR[*]}

# UnSorted
# for i in $(seq 0 $NLINE); do
#     echo "${LNARR[$i]} - ${STARR[$i]}"
# done

# pinaka goal is makakuha ng array of sorted ids
# Sort

sortSwap()
{
    # swap content string
    STMP="${STARR[$i]}"
    STARR[$i]="${STARR[$j]}"
    STARR[$j]="$STMP"

    # swap line number
    LNTMP="${LNARR[$i]}"
    LNARR[$i]="${LNARR[$j]}"
    LNARR[$j]="$LNTMP"
}

for i in $(seq 0 $(($NLINE-1))); do
    for j in $(seq $(($i+1)) $NLINE); do
        case "$ORDER" in
            a)
                if [[ "${STARR[$i]}" > "${STARR[$j]}" ]]; then
                    sortSwap
                fi
            ;;
            d)
                if [[ "${STARR[$i]}" < "${STARR[$j]}" ]]; then
                    sortSwap
                fi
            ;;
        esac
    done
done

# echo;
# echo "${STARR[*]}"
# echo
# echo
#
# echo "${LNARR[*]}"


# echo;echo;echo;echo
# Sorted
# for i in $(seq 0 $NLINE); do
#     echo "${LNARR[$i]}:${STARR[$i]}" | column -t -s:
# done
# echo;echo;echo;echo

echo ${LNARR[*]}

# echo "$CONTENT" | grep " 2:"
# echo ${LNARR[*]}
# for ID in ${LNARR[*]}; do
#     echo "$CONTENT" | grep " ${ID}:"
# done

# echo $NLINE
# echo ${#STARR[*]}




#
# for i in $(seq 0 $NLINE); do
#     LINE=
# done

# while read LINE; do
#     echo "$LINE"
# done < $(cat "$FILE" | nl)

# ID - STR
# compare str
# swap id
# final output, list of ids sorted by strings







exit 0
