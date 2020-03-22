#!/bin/bash


headCount=0
tailCount=0
while [ $headCount -lt 21 -a $tailCount -lt 21 ]
do
	r=$((RANDOM%2))
	if [ $r -eq  1 ]
	then
		headCount=$((headCount+1))
	else
		tailCount=$((tailCount+1))
	fi
done

if [ $headCount -eq 21 -a $tailCount -ne 21 ]
then
	echo "Heads Won by" $((headCount-tailCount)) "point"
elif [ $tailCount -eq 21 -a $headCount -ne 21 ]
then
	echo "Tails Won by" $((tailCount-headCount)) "point"
elif [ $headCount -eq 21 -a $tailcount -eq 2 ]
then
	echo "Its a Tie"
fi

