#!/bin/sh
for file in ./*;do
	if [ "${file##*.}"x = "eps"x ];then
		echo "$file is eps file"
		filename=${file%.*}
		echo "$filename"
		epstool --copy --bbox $file $filename.temp.eps
		epstopdf --hires --outfile=$filename.pdf $filename.temp.eps	
		rm -f $filename.temp.eps
	fi
done
read -p "Press any key to end"
