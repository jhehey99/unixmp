#!/bin/bash

DELSQL="DELETE FROM Contact";
if ! query.bash "$DELSQL"; then
    echo "Delete All Failed..."
    exit 1
fi

echo "Delete Contact Success..."

exit 0
