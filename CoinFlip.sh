#!/bin/bash


for i in {1..10}
do
	[ $((RANDOM%2)) -eq 1 ] && echo HEADS || echo TAILS
done
