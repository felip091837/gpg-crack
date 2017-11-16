#!/bin/bash

#EL1S1uM Was Here

if [ $# != 2 ]; then
	echo "USAGE: $0 file.gpg wordlist.txt"
else

for senha in $(cat $2); do
	gpg --passphrase $senha -d $1 &> /dev/null
	if [ $? == 0 ]; then
		echo
		echo "SUCESS - $senha"
		echo
		gpg --passphrase $senha -d $1
		break
	else
		echo "FAILED - $senha"
	fi
done
fi
