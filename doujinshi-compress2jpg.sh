#!/bin/bash

IFS=$'\n'

for a in	`find -type f`
do	ffmpeg -v 0 -i ${a} ${a}.jpg
	rm ${a}
done

for N in	`find -type d|grep /`
do	cd ${N}
	b=
	for a in	`ls`
	do	b=$((b+1))
		mv $a P$b.jpg
	done
	
	rename P P00 P?.jpg
	rename P P0 P??.jpg
	
	perl-rename 's\P\\g' *
	
	cd ../
done

echo Done!
