#!/bin/bash
set -e
# Parameter acquisition
STORAGE_ACCOUNT_1="$1"
STORAGE_ACCOUNT_2="$2"
CONTAINER_1="container1"
CONTAINER_2="container2"
RESOURCE_GROUP="yuval-rg"
echo "Using Storage Accounts: $STORAGE_ACCOUNT_1 and $STORAGE_ACCOUNT_2"

# Create SAS token
export STORAGE_ACCOUNT_1_SAS=$(az storage container generate-sas \
  --account-name $STORAGE_ACCOUNT_1 \
  --name container1 \
  --permissions rl \
  --expiry 2025-10-10T00:00:00Z \
  --output tsv)

  export STORAGE_ACCOUNT_2_SAS=$(az storage container generate-sas \
  --account-name $STORAGE_ACCOUNT_2 \
  --name container2 \
  --permissions rwl \
  --expiry 2025-10-10T00:00:00Z \
  --output tsv)

# Uploading files to first storage

    az storage blob upload-batch \
  --source $WORK_DIR/pipelines/temp_blobs/ \
  --destination $CONTAINER_1 \
  --account-name $STORAGE_ACCOUNT_1

echo "All files uploaded to Storage Account 1."

# Copying files from first storage to second
echo $STORAGE_ACCOUNT_1_SAS
azcopy copy \
"https://$STORAGE_ACCOUNT_1.blob.core.windows.net/container1?$STORAGE_ACCOUNT_1_SAS" \
"https://$STORAGE_ACCOUNT_2.blob.core.windows.net/container2?$STORAGE_ACCOUNT_2_SAS" \
--recursive --include-pattern "file*"



echo "All files copied from Storage Account A to B."
