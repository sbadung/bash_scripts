#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <file> <output_file>"
  exit 1
fi

file="$1"
output_file="$2"

if [ ! -f "$file" ]; then
  echo "Error: File '$file' does not exist."
  exit 1
fi

gpg -c --output "${output_file}.gpg" "$file"
