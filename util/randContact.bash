#!/bin/bash
NUM=$1

NAMES=( $(cat names.txt) )
NUMNAMES=${#NAMES[*]}

FILE="../randData"

echo -n > "$FILE"

for (( i=0; i<NUM; i++ ))
{
    # Name
    RANDNUM=$(( 1000 + $RANDOM % 9999 ))

    RANDFN=$(( $RANDOM % $NUMNAMES ))
    RANDMN=$(( $RANDOM % $NUMNAMES ))
    RANDLN=$(( $RANDOM % $NUMNAMES ))

    if [ $((RANDOM%50)) -gt 1 ]; then
        FN="${NAMES[$RANDFN]}"
    fi

    if [ $((RANDOM%20)) -gt 1 ]; then
        MN="${NAMES[$RANDMN]}"
    fi

    if [ $((RANDOM%50)) -gt 1 ]; then
        LN="${NAMES[$RANDLN]}"
    fi

    # Sex
    if [ $((RANDOM%5)) -gt 1 ]; then
        SEXES=( "M" "F" "O" )
        RANDSX=$(( $RANDOM % 2 ))
        SX=${SEXES[$RANDSX]}
    fi

    # Phone Number
    if [ $((RANDOM%5)) -gt 1 ]; then
        PN1=$(( 1000 + $RANDOM % 5000 ))
        PN2=$(( 1000 + $RANDOM % 5000 ))
        PN="90${PN1}${PN2}"
    fi

    # Email
    if [ $((RANDOM%5)) -gt 1 ]; then
        TLD=( "com" "ph" "edu" "org" "net" "int" "gov" "mil" )
        TLDN=${#TLD[*]}
        RANDTLDN=$(( $RANDOM % $TLDN ))
        RANDTLD=${TLD[$RANDTLDN]}

        DOM=( "gmail" "outlook" "yahoo" "protonmail" "email" "mailmail" )
        DOMN=${#DOM[*]}
        RANDDOMN=$(( $RANDOM % $DOMN ))
        RANDDOM=${DOM[$RANDDOMN]}

        LOCAL="${FN}.${LN}"
        EA="${LOCAL}@${RANDDOM}.${RANDTLD}"
    fi

    # Address
    if [ $((RANDOM%5)) -gt 1 ]; then
        STREET=( "Baclaran" "EDSA" "Libertad" "Gil Puyat" "Vito Cruz" "Quirino Avenue" "Pedro Gil" "U. N. Avenue" "Central Terminal" )
        STREETN=${#STREET[*]}
        RANDSTRN=$(( $RANDOM % $STREETN ))
        RANDSTRT=${STREET[$RANDSTRN]}
        AD="${PN1} ${RANDSTRT} St."
    fi

    # City
    if [ $((RANDOM%5)) -gt 1 ]; then
        CITIES=( Manila Makati Pasay Quezon Caloocan Taguig Malabon Marikina Pasig )
        CTN=${#CITIES[*]}
        RANDCTN=$(( $RANDOM % $CTN ))
        RANDCITY=${CITIES[$RANDCTN]}
        CT="${RANDCITY} City"
    fi

    # Zip COde
    if [ $((RANDOM%5)) -gt 1 ]; then
        ZP=$PN2
    fi

    if [ $((RANDOM%500)) -eq 0 ]; then
        echo "$FN""$MN":"$LN":"$SX":"$PN":"$EA":"$AD":"$CT":"$ZP" >> "$FILE"
    elif [ $((RANDOM%500)) -eq 1 ]; then
        echo "$FN":"$MN""$LN":"$SX":"$PN":"$EA":"$AD":"$CT":"$ZP" >> "$FILE"
    elif [ $((RANDOM%500)) -eq 2 ]; then
        echo "$FN":"$MN":"$LN""$SX":"$PN":"$EA":"$AD""$CT":"$ZP" >> "$FILE"
    elif [ $((RANDOM%500)) -eq 3 ]; then
        echo "$FN":"$MN":"$LN":"$SX""$PN":"$EA":"$AD":"$CT":"$ZP" >> "$FILE"
    elif [ $((RANDOM%500)) -eq 4 ]; then
        echo "$FN":"$MN":"$LN":"$SX":"$PN""$EA":"$AD":"$CT":"$ZP" >> "$FILE"
    elif [ $((RANDOM%500)) -eq 5 ]; then
        echo "$FN":"$MN":"$LN""$SX":"$PN":"$EA""$AD":"$CT":"$ZP" >> "$FILE"
    elif [ $((RANDOM%500)) -eq 6 ]; then
        echo "$FN":"$MN":"$LN":"$SX":"$PN":"$EA":"$AD""$CT":"$ZP" >> "$FILE"
    elif [ $((RANDOM%500)) -eq 7 ]; then
        echo "$FN":"$MN":"$LN":"$SX":"$PN":"$EA":"$AD":"$CT""$ZP" >> "$FILE"
    else
        echo "$FN":"$MN":"$LN":"$SX":"$PN":"$EA":"$AD":"$CT":"$ZP" >> "$FILE"
    fi

    # ../core/addContact.bash "$FN" "$MN" "$LN" "$SX" "$PN" "$EA" "$AD" "$CT" "$ZP"
    unset FN MN LN SX PN EA AD CT ZP
}

exit 0
