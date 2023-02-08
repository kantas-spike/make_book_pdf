#!/usr/bin/env bash

PDF_DIR=build/pdf
SLEEP_SEC=15

if [ ! -d ${PDF_DIR} ];then
    echo "mkdir ${PDF_DIR} ..."
    mkdir -p ${PDF_DIR}
fi


idx=1
while read line
do
    output_path=${PDF_DIR}/`printf "%02d" $idx`0.pdf
    echo "download ${line} to ${output_path} ..."
    curl ${line} -o ${output_path}
    idx=$(($idx+1))
    echo "sleep ${SLEEP_SEC}sec..."
    sleep ${SLEEP_SEC}
done < ./URL.txt
