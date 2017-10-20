#!/bin/bash
# The following code is licensed under the GNU General Public License Version 3.0 (GPLv3)
# You should have received a copy of the license with this software.
#
# Usage: ./unwatermarkpdf.sh FILENAME WATERMARK RANGE
# RANGE is optional, e.g. 3-r3 removes first two and last two pages of the pdf
# Uncomment last line for destructive editing.
#
# get name of file without path
f=$(basename $1)
# get extension of file
ext=`rev<<<$f | cut -f1 -d"." | rev`

range=${3-1-end}
if [ ! -f $1 ]; then
	echo "File does not exist."
elif [ ! ${ext^^} == "PDF" ]; then
	echo "This is not a PDF"
elif [ -z ${2+x} ]; then
	echo "No watermark given"
else
  mkdir .unwatermarkpdftemp
  pdftk $1 cat $range output .unwatermarkpdftemp/uncompressed.pdf uncompress
  cd .unwatermarkpdftemp
  sed -e "s/$2/ /g" <uncompressed.pdf >unwatermarked.pdf
  pdftk unwatermarked.pdf output fixed.pdf
  pdftk fixed.pdf output ../clean_$f compress
  cd ..
  rm -r .unwatermarkpdftemp
  # mv clean_$f $1
fi
