#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <encrypted_file> <output_file>"
  exit 1
fi

encrypted_file="$1"
output_file="$2"
working_dir=".symmetric_decrypt_folder.temp"

if [ ! -f "$encrypted_file" ]; then
  echo "Error: Encrypted file '$encrypted_file' does not exist."
  exit 1
fi

mkdir "${working_dir}"
mkdir "${output_file}"

gpg --output "${working_dir}/${output_file}.tar.gz" --decrypt "$encrypted_file"

tar -xvzf "${working_dir}/${output_file}.tar.gz" -C "${output_file}/"

rm -rf "${working_dir}"

echo "Decompression complete. Decompressed files saved in the '${output_file}' directory."
