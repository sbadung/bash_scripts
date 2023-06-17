#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <folder> <output_file>"
  exit 1
fi

folder="$1"
output_file="$2"
working_dir=".symmetric_encrypt_folder.temp"

if [ ! -d "$folder" ]; then
  echo "Error: Folder '$folder' does not exist."
  exit 1
fi

mkdir "${working_dir}"

tar -cvzf "${working_dir}/${output_file}.tar.gz" "$folder"

gpg -c --output "${output_file}.tar.gz.gpg" "${working_dir}/${output_file}.tar.gz"

rm -rf "${working_dir}"

echo "Encryption complete. Encrypted archive saved as '${output_file}.tar.gz.gpg'."
