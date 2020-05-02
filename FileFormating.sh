#! /bin/bash
echo "File Formating Starting"

sed 's/[,]//g' output.csv -- Comma Remove
sed -e 's|["'\'']||g' output.csv  -- Single Quote Remove
sed 's/\"//g' output.csv  -- Double Quotes Remove
sed 's/ //g' test2 -- remove space
awk 'NR%2{printf "%s ",$0;next;}1' test2 -- Merge every two lines
cat test3 | sed -e 's/^[ \t]*//' -- Remove leading spaces
