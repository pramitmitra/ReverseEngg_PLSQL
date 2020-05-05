#! /bin/bash
# Supporting module to format output file.
repository=$1
localFolder=$2
input_file=$3
input_path=$4
echo "Git Repo to be downloaded : $repository"

# Clean-up before git clone
rm -rf $localFolder

#Git clone
git clone "$repository" "$localFolder"
echo "File ${input_file} has been downloaded at $localFolder"

#Copy only relevant PL/SQL file to input_path
cp ${localFolder}/${input_file} ${input_path}
echo "$input_file has been moved to $input_path for processing"