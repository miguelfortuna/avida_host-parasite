#!/bin/bash

x=0;
while read line
do
	x=$(($x+1))
	echo $x
	echo $line | sed 's/./&\n/g' | head -n -1 > tmp.txt
	awk 'BEGIN{FS=" "} NR==FNR{a[$2]=$1} NR>FNR{$1=a[$1];print}' OFS='\n' instructions.txt tmp.txt > 50_merely_viable_organisms/organism_1.org
done < merely_viable_sequences.txt
rm tmp.txt

