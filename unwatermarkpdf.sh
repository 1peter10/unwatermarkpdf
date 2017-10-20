#!/bin/bash
# The following code is licensed under the GNU General Public License Version 3.0 (GPLv3)
# You should have received a copy of the license with this software.
#
# Usage: ./unwatermark.sh FILENAME WATERMARK RANGE
# RANGE is optional, e.g. 3-r3 removes first two and last two pages of the pdf
# Uncomment last line for destructive editing.
#
range=${3-1-end}
if [ ! -f $1 ]; then
	echo "File does not exist."
elif [ ! ${1: -4} == ".pdf" ]; then
	echo "This is not a PDF"
elif [ -z ${2+x} ]; then
	echo "No watermark given"
else
  mkdir .unwatermarkpdftemp
  pdftk $1 cat $range output .unwatermarkpdftemp/uncompressed.pdf uncompress
  cd .unwatermarkpdftemp
  sed -e "s/$2/ /g" <uncompressed.pdf >unwatermarked.pdf
  pdftk unwatermarked.pdf output fixed.pdf
  pdftk fixed.pdf output ../clean_$1 compress
  cd ..
  rm -r .unwatermarkpdftemp
  # mv clean_$1 $1
fi
