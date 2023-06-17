#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <archive.tar.gz> <output_folder>"
  exit 1
fi

archive="$1"
output_folder="$2"

if [ ! -f "$archive" ]; then
  echo "Error: Archive '$archive' does not exist."
  exit 1
fi

mkdir "${output_folder}"
tar -xvzf "$archive" -C "${output_folder}/"