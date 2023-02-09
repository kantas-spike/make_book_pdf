#!/usr/bin/env bash

PDF_DIR=build/pdf
OUTPUT_PDF=./build/_make.pdf

echo cp additional_info.pdf ${PDF_DIR}/025.pdf ...
cp -p ./additional_info.pdf ${PDF_DIR}/025.pdf

echo "merge pdfs to ${OUTPUT_PDF} ..."
gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=${OUTPUT_PDF} -dBATCH $PDF_DIR/*.pdf

#18.17 × 23.29 cm