# unwatermarkpdf
A simple bash script to remove annoying watermarks in PDF on Linux or compatible systems.
Has an option to cut of pages at begining and end of your pdf.
Requires: `pdftk`, `sed`, `bash`

__Usage:__

    ./unwatermarkpdf.sh file.pdf "text you want to remove" _range (optional)_

(For range syntax I refer to the  "cat [\<page ranges\>]" part of the pdftk man page.)

__To Do:__

- bulk watermark removal (multiple files at once),
- add a parameter for non destructive editing,
- maybe rewrite this in something else, like python.
