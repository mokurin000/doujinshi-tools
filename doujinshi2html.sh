#!/usr/bin/bash
if [ "$1"x != convertx ]
	then	echo Usage: $0 convert [filename.html]
		echo works in：a directory with some images
		exit 0
fi
if [ "$2"x != x ]
	then	exec 3> $2
	else	exec 3> output.html
fi
echo -e -n '<!doctype html><html>\n<head>\n<meta charset="utf-8">\n</head>'"<body>" >&3
for var in `find . -name "*[Gg]"` `find . -name "*[Pp]"`
do	case $var in
	*.[Pp][Nn][Gg])
			Format="png"
  		;;
	*.[Jj][Pp]*[Gg])
  			Format="jpeg"
  		;;
	*.[Ww][Ee][Bb][Pp])
			Format="webp"
		;;
	*.[Bb][Mm][Pp])
			Format="bmp"
		;;
	esac
	echo '<img src="data:image/'$Format\;base64, >&3
	base64 $var >&3
	echo -e '">\n</img>' >&3
done
echo -n '</body></html>' >&3
echo Done!
