#!/bin/bash
#
# Usage: ./unwatermark.sh FILENAME WATERMARK RANGE
# RANGE is optional, e.g. 3-r3 removes first two and last two pages of the pdf
# Uncomment last line for destructive editing.
#
range=${3-1-end}
mkdir .temp
pdftk $1 cat $range output .temp/uncompressed.pdf uncompress
cd .temp
sed -e "s/$2/ /g" <uncompressed.pdf >unwatermarked.pdf
pdftk unwatermarked.pdf output fixed.pdf
pdftk fixed.pdf output ../clean_$1 compress
cd ..
rm -r .temp
# mv clean_$1 $1
