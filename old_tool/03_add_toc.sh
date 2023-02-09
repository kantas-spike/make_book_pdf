#!/usr/bin/env bash

REPO_DIR=build/pdfoutline
INPUT_PDF=./build/_make.pdf
TOC_FILE=./toc.txt
OUTPUT_PDF=./make_merged.pdf

if [ ! -d ${REPO_DIR} ];then
    echo git clone https://github.com/yutayamamoto/pdfoutline.git ${REPO_DIR} ...
    git clone https://github.com/yutayamamoto/pdfoutline.git ${REPO_DIR}
fi

python3 ${REPO_DIR}/pdfoutline.py ${INPUT_PDF} ${TOC_FILE} ${OUTPUT_PDF}
