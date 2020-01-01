#!/bin/sh

MOVIES_FOLDER=.
COMPLETE_FOLDER=./complete
for filename in $MOVIES_FOLDER/*.mp4; do
    [ -e "$filename" ] || continue
    ffmpeg -i $filename -map 0 -c copy -c:v:0 libx264 -crf 20 -preset slower -profile:v:0 High -level:v:0 4.0 -aspect:v:0 1920:1080 -nostats -nostdin -f mp4 -y $COMPLETE_FOLDER/$filename.compressed.mp4
    mv $filename $COMPLETE_FOLDER/$filename
done
