#!/bin/bash

ID="$1"

# check if ID is INT
DELSQL="DELETE FROM Contact WHERE ID = '${ID}'";
if ! query.bash "$DELSQL"; then
    echo "Delete Contact Failed..."
    exit 1
fi

echo "Delete Contact Success..."


exit 0
