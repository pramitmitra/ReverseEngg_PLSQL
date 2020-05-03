#! /bin/bash
# Supporting module to format output file.


## Removing Control M Character
awk 'NR%3' /Users/prammitr/Documents/my_projects/python/temp/dict.csv > /Users/prammitr/Documents/my_projects/python/temp/temp1_output_with_comma.csv
## Comma Remove
sed 's/[,]//g' /Users/prammitr/Documents/my_projects/python/temp/temp1_output_with_comma.csv > /Users/prammitr/Documents/my_projects/python/temp/temp2.csv

## Single Quote Remove
sed "s/'/ /g" /Users/prammitr/Documents/my_projects/python/temp/temp2.csv > /Users/prammitr/Documents/my_projects/python/temp/temp3.csv

## Double Quotes Remove
sed 's/\"//g' /Users/prammitr/Documents/my_projects/python/temp/temp3.csv > /Users/prammitr/Documents/my_projects/python/temp/temp4.csv

## Merge adjucent two lines
awk 'NR%2{printf "%s ",$0;next;}1' /Users/prammitr/Documents/my_projects/python/temp/temp4.csv > /Users/prammitr/Documents/my_projects/python/temp/temp5.csv

## Remove leading spaces
cat /Users/prammitr/Documents/my_projects/python/temp/temp5.csv | sed -e 's/^[ \t]*//' > /Users/prammitr/Documents/my_projects/python/temp/temp6.csv

## Replacing Space delimited with comma seperated
sed 's/ \{1,\}/,/g' /Users/prammitr/Documents/my_projects/python/temp/temp6.csv > /Users/prammitr/Documents/my_projects/python/temp/temp7.csv

## Adding Static Header
cat /Users/prammitr/Documents/my_projects/python/static_hederFile.txt > /Users/prammitr/Documents/my_projects/python/output/STMMapping.csv
cat /Users/prammitr/Documents/my_projects/python/temp/temp7.csv >> /Users/prammitr/Documents/my_projects/python/output/STMMapping.csv

## Cleanup
rm -rf /Users/prammitr/Documents/my_projects/python/temp/*


