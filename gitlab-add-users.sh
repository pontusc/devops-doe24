#!/bin/bash
# Takes three parameters to add users to a gitlab project
# First parameter is a file with one email per row of all users you want to add to a given project
# Second parameter is a file with your gitlab token
# Third parameter is the project id

# This requires user to have their email PUBLIC, else cannot be found

EMAILS=$(cat $1)
TOKEN=$2
ProjectID=$3

if [[ $# -ne 3 ]];then
    echo "Not 3 parameters given"
fi

# Setup
ACCESS_LEVEL=10 # Guest, change if you want something else
HEADER="PRIVATE-TOKEN: $(cat token)"
ID_LIST=""
API="https://gitlab.com/api/v4"

for EMAIL in $EMAILS;do
    # Per email get users ID, then add to project
    ID_LIST+="$(curl --silent --header "$HEADER" --url ""$API"/users\?search=$EMAIL" | \
    jq .[0].id)"$','
done

ID_LIST=${ID_LIST::-1} # Lazy fix of removing trailing comma

# Send request to add all users to project
curl --request POST --header "$HEADER" --data "user_id="$ID_LIST"&access_level="$ACCESS_LEVEL"" \
     --url ""$API"/projects/"$ProjectID"/members"