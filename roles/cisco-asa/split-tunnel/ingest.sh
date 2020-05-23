if [[ "$1" == "inside" ]]; then
  ACL="Inside-Split-ACL"
elif [[ "$1" == "outside" ]]; then
  ACL="Outside-Split-ACL"
fi

EXPECTED_STATE_FILE="expected_state.csv"
DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"
EXPECTED_STATE_LOCATION="$DIR/$EXPECTED_STATE_FILE"

COMMENT_FREE() {
  cat "$EXPECTED_STATE_LOCATION" | sed -e '/^[ \t\n]*#/d' | sed -e '/^ *$/d'
}

for line in $(COMMENT_FREE | grep "$1"); do

  STATE="$(echo "$line" | awk -F "," '{print $1}')"
  DIRECTION="$(echo "$line" | awk -F "," '{print $2}')"
  NETWORK="$(echo "$line" | awk -F "," '{print $3}')"
  SUBNETMASK="$(echo "$line" | awk -F "," '{print $4}')"
  #FILENAME="$DIR/$DIRECTION.txt"

  if [[ "$SUBNETMASK" == "none" ]] || [[ "$SUBNETMASK" == "255.255.255.255" ]]; then
    if [[ "$STATE" == "remove" ]]; then
      echo "no access-list $ACL standard permit host $NETWORK"
    else
      echo "access-list $ACL standard permit host $NETWORK"
    fi
  elif [[ "$STATE" == "remove" ]]; then
    echo "no access-list $ACL standard permit $NETWORK $SUBNETMASK"
  else
    echo "access-list $ACL standard permit $NETWORK $SUBNETMASK"
  fi
done
