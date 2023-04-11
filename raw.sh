#!/bin/bash

# Input parameters
SAS_TOKEN="$1" # SAS token for the Azure file share
FILE_SHARE_NAME="$2" # Azure file share name
FILE_NAME="$3" # File name to download from the Azure file share

# Download file from Azure file share
azcopy copy "https://${FILE_SHARE_NAME}.file.core.windows.net${FILE_NAME}${SAS_TOKEN}" ./


# Extract the .pem file with each alias
echo "Extracting .pem file..."
openssl x509 -inform DER -in "$file_path" -outform PEM -out "$file_path.pem"
aliases=$(openssl x509 -noout -text -in "$file_path.pem" | grep "Alias" | awk -F': ' '{print $2}')
for alias in $aliases; do
  echo "Alias: $alias"
done

# Download the file using the SAS token
wget -q --no-check-certificate --no-proxy "$SAS_TOKEN_URL" -O "$FILE_NAME"

# Download file from Azure file share
azcopy copy "https://$FILE_SHARE_NAME.file.core.windows.net/\$root/$FILE_NAME$SAS_TOKEN" "/tmp/$FILE_NAME"

# List all the aliases in the keystore
aliases=$(keytool -list -keystore "$keystore_path" -storepass "$keystore_password" | grep "Alias name:" | awk -F ": " '{print $2}')

# Loop through each alias and extract .pem file
for alias in $aliases; do
    # Extract .pem file from keystore
    keytool -export -alias "$alias" -file "$alias.pem" -keystore "$keystore_path" -storepass "$keystore_password"

    # Move .pem file to output directory
    mv "$alias.pem" "$output_directory/$alias.pem"

    echo "Extracted $alias.pem to $output_directory"
done
