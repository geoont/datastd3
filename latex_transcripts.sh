#!/bin/bash
#
# creates nicely formatted transcription of Chinese feature names
#

tmpdir=temp

[[ -d "$tmpdir" ]] || mkdir "$tmpdir"

tail -n +2 TMOI.csv | while read s
do
    cat = ${s:,}
    echo $cat
done
