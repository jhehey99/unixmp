#!/bin/bash

# Name
RANDNUM=$(( 1000 + $RANDOM % 9999 ))
FN="first_${RANDNUM}"
MN="middle_${RANDNUM}"
LN="last_${RANDNUM}"

# Sex
SEXES=( "M" "F" )
RANDSX=$(( $RANDOM % 2 ))
SX=${SEXES[$RANDSX]}

# Phone Number
PN1=$(( 1000 + $RANDOM % 5000 ))
PN2=$(( 1000 + $RANDOM % 5000 ))
PN="9${PN1}${PN2}"

# Email
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

# Address
STREET=( "Baclaran" "EDSA" "Libertad" "Gil Puyat" "Vito Cruz" "Quirino Avenue" "Pedro Gil" "U. N. Avenue" "Central Terminal" )
STREETN=${#STREET[*]}
RANDSTRN=$(( $RANDOM % $STREETN ))
RANDSTRT=${STREET[$RANDSTRN]}
AD="${PN1} ${RANDSTRT} St."

# City
CITIES=( Manila Makati Pasay Quezon Caloocan Taguig Malabon Marikina Pasig )
CTN=${#CITIES[*]}
RANDCTN=$(( $RANDOM % $CTN ))
RANDCITY=${CITIES[$RANDCTN]}
CT="${RANDCITY} City"

# Zip COde
ZP=$PN2

../core/addContact.bash "$FN" "$MN" "$LN" "$SX" "$PN" "$EA" "$AD" "$CT" "$ZP"

exit 0
