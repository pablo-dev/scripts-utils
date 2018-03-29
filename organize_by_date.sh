#!/bin/bash

FOLDERS=("/home/vagrant/ftp_tests/folder1/" "/home/vagrant/ftp_tests/folder2/" "/home/vagrant/ftp_tests/folder3/")

for folder in ${FOLDERS[@]}; do
  for file in `find ${folder} -maxdepth 1 -type f -print0 | xargs -0r ls`; do
    y=$(date -r "${file}" +%Y)
    m=$(date -r "${file}" +%m)
    d=$(date -r "${file}" +%d)
    newfolder="${folder}/${y}/${m}/${d}"
    mkdir -p -m750 ${newfolder}
    mv "${file}" "${newfolder}/"
    unset y
    unset m
    unset d
  done
done
