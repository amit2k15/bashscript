#!/bin/bash

# Function to get expiry date from .pem file
get_expiry_date() {
  pem_file="$1"
  expiry_date=$(openssl x509 -enddate -noout -in "$pem_file" | awk -F'=' '{print $2}')
  echo "$expiry_date"
}

# Function to get remaining days until certificate expiry
get_remaining_days() {
  pem_file="$1"
  expiry_date=$(get_expiry_date "$pem_file")
  expiry_epoch=$(date -d "$expiry_date" +%s)
  current_epoch=$(date +%s)
  remaining_seconds=$((expiry_epoch - current_epoch))
  remaining_days=$((remaining_seconds / 86400))
  echo "$remaining_days"
}

# Main script
if [ $# -ne 2 ]; then
  echo "Usage: $0 <pem_file> <function_name>"
  exit 1
fi

pem_file="$1"
function_name="$2"

case "$function_name" in
  "get_expiry_date")
    get_expiry_date "$pem_file"
    ;;
  "get_remaining_days")
    get_remaining_days "$pem_file"
    ;;
  *)
    echo "Invalid function name. Available functions: get_expiry_date, get_remaining_days"
    exit 1
    ;;
esac
