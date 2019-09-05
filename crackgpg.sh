#!/bin/bash

#felipesi Was Here

if [ "$#" != 2 ]; then
        echo "USAGE: $0 file.gpg wordlist.txt"
else

while read pass; do
        gpg --batch --passphrase "$pass" "$1" &> /dev/null
        if [ "$?" == 0 ]; then
                echo
                echo "SUCESS - $pass"
                echo
                break
        else
                echo "FAILED - $pass"
        fi
done < "$2"
fi
