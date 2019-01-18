#!/usr/bin/bash
if [ "$1"x != convertx ]
then
	echo 用法: $0 convert [输出文件名]
	echo 工作目录：目录下为同人志图片文件
	exit 0
fi
if [ "$2"x != x ]
then
	OPFILE=$2
else
	OPFILE=output.html
fi
echo -e -n '<!doctype html><html>\n<head>\n<meta charset="utf-8">\n</head>'"<body>" > $OPFILE
for var in `find . -name "*[Gg]"` `find . -name "*[Pp]"`
do	case $var in
	*[Pp][Nn][Gg])
			Format="png"
  		;;
	*[Jj][Pp]*[Gg])
  			Format="jpeg"
  		;;
	*[Ww][Ee][Bb][Pp])
			Format="webp"
		;;
	*[Bb][Mm][Pp])
			Format="bmp"
		;;
	esac
	echo -e '<img src="data:image/'$Format\;base64,`base64 $var`'">\n</img>' >> $OPFILE
done

echo -n '</body></html>' >> $OPFILE

