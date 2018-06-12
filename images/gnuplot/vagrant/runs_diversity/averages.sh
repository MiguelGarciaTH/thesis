#!/usr/bin/env bash

for i in `ls *_th` 
do
	str=$(echo $i | tr "_" "\n" | grep -v "_th")
	echo $str  " "  `./avg.sh $i`
done

