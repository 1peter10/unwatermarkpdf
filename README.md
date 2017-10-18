# unwatermarkpdf

A simple bash script to remove annoying watermarks in PDF on Linux or compatible systems (confirmed to work with "Ubuntu on Windows").
Has an option to cut of pages at begining and end of your pdf.
Requires: `pdftk`, `sed`, `bash`

__Usage:__

    # Usage: ./unwatermark.sh FILENAME WATERMARK RANGE
    # RANGE is optional, e.g. 3-r3 removes first two and last two pages of the pdf 

(For more RANGE syntax I refer to the  "cat [\<page ranges\>]" part of the pdftk man page.)

__To Do:__

- bulk watermark removal (multiple files at once),
- add a parameter for non destructive editing,
- maybe rewrite this in something else, like python.
