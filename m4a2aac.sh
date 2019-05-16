#!/bin/bash

mkdir -p tmp
mkdir -p aac

for src in *.m4a; do
    dst="tmp/$src"
    afconvert -f m4af -d aac -v -s 3 -q 72 "$src" "$dst"
    ffmpeg -i "$src" -i "$dst" -map 0?:v -c:v copy -map 1:a -c:a copy -map_metadata 0 "aac/$src"
done

rm -r tmp
