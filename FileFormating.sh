#! /bin/bash
# Supporting module to format output file.

file_name=$1
base_path=$2
temp_path=$3

echo "PL/SQL file: ${file_name} formating starting at ${temp_path}"
## Removing Control M Character
awk 'NR%3' ${temp_path}/dict.csv > ${temp_path}/temp1_output_with_comma.csv
## Comma Remove
sed 's/[,]//g' ${temp_path}/temp1_output_with_comma.csv > ${temp_path}/temp2.csv

## Single Quote Remove
sed "s/'/ /g" ${temp_path}/temp2.csv > ${temp_path}/temp3.csv

## Double Quotes Remove
sed 's/\"//g' ${temp_path}/temp3.csv > ${temp_path}/temp4.csv

## Merge adjucent two lines
awk 'NR%2{printf "%s ",$0;next;}1' ${temp_path}/temp4.csv > ${temp_path}/temp5.csv

## Remove leading spaces
cat ${temp_path}/temp5.csv | sed -e 's/^[ \t]*//' > ${temp_path}/temp6.csv

## Replacing Space delimited with comma seperated
sed 's/ \{1,\}/,/g' ${temp_path}/temp6.csv > ${temp_path}/temp7.csv

## Adding Static Header
cat ${base_path}/static_hederFile.txt > ${base_path}/output/STM_${file_name}.csv
cat ${temp_path}/temp7.csv >> ${base_path}/output/STM_${file_name}.csv

echo "STM file STM_${file_name}.csv is available at ${base_path}/output"

## Cleanup
rm -rf ${temp_path}/*

