#!/bin/bash

# for x in *.*; do enscript $x -o - | ps2pdf - ~/experter_pdf/$x.pdf; done
generatepdf() {
	for x in $1/*; do 

	if [ -d "$x" ]
		then
		echo "dir: $x"
		mkdir "${x##*/}"
		cd "${x##*/}"
		generatepdf $x
		cd ..

	else
		filename="${x##*/}"
		echo $filename
		cat $x | iconv -c -f utf-8 -t ISO-8859-1 | enscript -o - | ps2pdf - ~/experter_pdf/pdf/$filename.pdf
	fi
done
}

generatepdf ~/experter_pdf/experter

