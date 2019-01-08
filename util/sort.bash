#!/bin/bash


FILE="$1"

# STRS=( $(cat "$FILE") )
#
# for STR in ${STRS[*]}; do
#     echo "$STR"
# done

CONTENT=$(cat "$FILE" | nl | tr "\t" ":")
# echo "$CONTENT"

NLINE=$(( $( echo "$CONTENT" | wc -l)-1 ))
# echo $NLINE

IDS=$(echo "$CONTENT" | cut -f1 -d":" | tr -d " ")
# echo "$IDS"

STRS=$(echo "$CONTENT" | cut -f2 -d":")
# echo "$STRS"

# ung STRS is ung field which is sorted
# kailangan ng array na each line sa STRS is an element
STARR=()
IDARR=()
for i in $(seq 0 $NLINE); do
    STARR[$i]=$(echo "$STRS" | head -$(($i+1)) | tail -1)
    IDARR[$i]=$(echo "$IDS" | head -$(($i+1)) | tail -1)
    # echo "${STARR[$i]}"
done


# echo ${#STARR[*]}

# UnSorted
# for i in $(seq 0 $NLINE); do
#     echo "${IDARR[$i]} - ${STARR[$i]}"
# done

# pinaka goal is makakuha ng array of sorted ids
# Sort
for i in $(seq 0 $(($NLINE-1))); do
    for j in $(seq $(($i+1)) $NLINE); do
        if [[ "${STARR[$i]}" > "${STARR[$j]}" ]]; then
            # swap str
            STMP="${STARR[$i]}"
            STARR[$i]="${STARR[$j]}"
            STARR[$j]="$STMP"

            # swap id
            IDTMP="${IDARR[$i]}"
            IDARR[$i]="${IDARR[$j]}"
            IDARR[$j]="$IDTMP"
        fi
    done
done

# echo;echo;echo;echo
# Sorted
for i in $(seq 0 $NLINE); do
    echo "${IDARR[$i]} - ${STARR[$i]}"
done
echo;echo;echo;echo

# echo "$CONTENT" | grep " 2:"
# echo ${IDARR[*]}
for ID in ${IDARR[*]}; do
    echo "$CONTENT" | grep " ${ID}:"
done



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
