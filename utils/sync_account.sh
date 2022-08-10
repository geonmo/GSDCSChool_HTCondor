#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Sync account information for node1,node2,node3,node4"
    for num in {1..4}
    do
        sudo scp /etc/passwd root@node${num}:/etc/passwd
        sudo scp /etc/shadow root@node${num}:/etc/shadow
    done

elif [ "$#" -eq 1 ]; then
    echo "Sync account information for node1,node2,node3.$1"
    for num in {1..4}
    do
        sudo scp /etc/passwd root@node${num}.$1:/etc/passwd
        sudo scp /etc/shadow root@node${num}.$1:/etc/shadow
    done
else 
    echo "wrong argv"
fi


