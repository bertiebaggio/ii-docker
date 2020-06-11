#!/bin/sh
WAIT=10


while true; do
    ii -i $IIDIR -s $SERVER -n $NICK -f $FULLNAME &
    iipid="$!"
    sleep $WAIT
    wait "$iipid"
done
