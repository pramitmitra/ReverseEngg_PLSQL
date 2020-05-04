#! /bin/bash
# Supporting module to format output file.
repository=$1
localFolder=$2
input_file=$3
input_path=$4
echo "Git Repo to be downloaded : $repository"


#rm -rf /Users/prammitr/Documents/my_projects/python/temp
rm -rf $localFolder

#git clone "$repository" "$localFolder"
git clone "$repository" "$localFolder"
echo "File has been downloaded at $localFolder"

#cp /Users/prammitr/Documents/my_projects/python/temp/input_plSql.sql /Users/prammitr/Documents/my_projects/python/input
cp ${localFolder}/${input_file} ${input_path}
#rm -rf /Users/prammitr/Documents/my_projects/python/ReadingNotes
echo "$input_file has been moved to $input_path"