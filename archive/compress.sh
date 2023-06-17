#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <input_folder> <output_folder>"
  exit 1
fi

folder="$1"
output_folder="$2"

if [ ! -d "$folder" ]; then
  echo "Error: Folder '$folder' does not exist."
  exit 1
fi

tar -cvzf "${output_folder}.tar.gz" "$folder"
