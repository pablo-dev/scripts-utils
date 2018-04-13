#!/bin/bash

declare -A sizes=( [mipmap-hdpi]=72 [mipmap-mdpi]=48 [mipmap-xhdpi]=96 [mipmap-xxhdpi]=144 [mipmap-xxxhdpi]=192 )

file=$1

# check file exists
if [ ! -f $1 ]; then
    echo "File $1 not found"
    exit -1
fi

# convert to all sizes
for size in "${!sizes[@]}"; do
    echo ${size} -- ${sizes[$size]}
    size_px=${sizes[$size]}
    echo "converting ${file} to size ${size}"
    mkdir -p ${file%%.*}/${size}
    echo "convert $1 -resize ${size_px}x${size_px} ${file}/${size}/${file}"
    convert $1 -resize ${size_px}x${size_px} ${file%%.*}/${size}/${file}
done
