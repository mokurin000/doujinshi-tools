#!/usr/bin/bash
:<<QWQ
needs ffmpeg rename and libraries.
工作目录： 目录下有多个文件夹，其中皆为本子。没有*txt之类的东西
Thumb.db会自动删除。
适合本子压制组使用
POWERED BY PE
QWQ
find -name *db -delete

while	ls *\ * &> /dev/null
do	rename \  空__格 * &> /dev/null
done

for N in	`find -type d|grep /`
do	cd "$N"
	while	ls *\ * &> /dev/null
	do	rename \  空__格 * &> /dev/null
	done

	cd ../
done

for a in	`find -type f`
do	ffmpeg -v 0 -i "$a" "$a.jpg"
	rm "$a"
done

a=

for N in	`find -type d|grep /`
do	cd "$N"
	b=

	for a in	`ls`
	do	b=$((b+1))
		mv $a P$b.jpg
	done

	rename P P00 P?.jpg &> /dev/null
	rename P P0 P??.jpg &> /dev/null

	for a in `ls`
	do	mv $a ${a#P*}
	done

	cd ../
done
N=;a=;b=

while	ls *空__格* &> /dev/null
do	rename 空__格 \  * &> /dev/null
done

echo Done!

