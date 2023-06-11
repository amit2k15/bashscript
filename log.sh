#!/bin/bash

log_file="path/to/log/file.log"
output_file="path/to/output/file.txt"

grep -oE "Duplicate entry '[0-9]+' " "$log_file" | sed "s/Duplicate entry '\([0-9]\+\)'/\1/g" > "$output_file"

echo "Extraction complete. Results saved to $output_file"
