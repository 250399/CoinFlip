#!/bin/bash


simulator () {
	if [ $headCount -eq 21 -a $flag -eq 0 ]
	then
		flag=1
		arr[0]=Head 
		arr[1]=$((headCount-tailCount))
		return 
	elif [ $tailCount -eq 21 -a $flag -eq 0 ] 
	then
		flag=1
		arr[0]=Tails 
		arr[1]=$((tailCount-headCount))
		return 
	elif [ $headCount -ge $((tailCount+2)) -a $flag -eq 1 ]
	then
		arr[2]=Head
		return
	elif [ $tailCount -ge $((headCount+2)) -a $flag -eq 1 ]
	then
		arr[2]=Tails
		return
	fi
		r=$((RANDOM%2))
		if [ $r -eq  1 ]
		then
			headCount=$((headCount+1))
		else
			tailCount=$((tailCount+1))
		fi
		simulator
}


headCount=0
tailCount=0
flag=0
simulator
echo ${arr[0]} "won by" ${arr[1]} "points"
[[ "${arr[0]}" == "Head" ]] && tailCount=`expr $tailCount + ${arr[1]}` || headCount=`expr $headCount + ${arr[1]}`
if [ $headCount -eq $tailCount ]
then
	echo Its Tie
	simulator
fi
echo "Final Winner is "${arr[2]}
