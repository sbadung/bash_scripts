#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <encrypted_file> <output_file>"
  exit 1
fi

encrypted_file="$1"
output_file="$2"

if [ ! -f "$encrypted_file" ]; then
  echo "Error: Encrypted file '$encrypted_file' does not exist."
  exit 1
fi

gpg --output "${output_file}.decrypted" --decrypt "$encrypted_file"
