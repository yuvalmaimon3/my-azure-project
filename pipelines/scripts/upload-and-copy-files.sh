#!/bin/bash
set -e
# Parameter acquisition
STORAGE_ACCOUNT_1="$1"
STORAGE_ACCOUNT_2="$2"
CONTAINER_1="container1"
CONTAINER_2="container2"
RESOURCE_GROUP="yuval-rg"
echo "Using Storage Accounts: $STORAGE_ACCOUNT_1 and $STORAGE_ACCOUNT_2"


# Uploading files to first storage

    az storage blob upload-batch \
  --source /home/yuval/my-azure-project/pipelines/temp_blobs/ \
  --destination $CONTAINER_1 \
  --account-name $STORAGE_ACCOUNT_1

echo "All files uploaded to Storage Account 1."

# Copying files from first storage to second
echo $STORAGE_ACCOUNT_1_SAS
azcopy copy \
"https://sg1oizgrfizgvyyy.blob.core.windows.net/container1?$STORAGE_ACCOUNT_1_SAS" \
"https://sg2oizgrfizgvyyy.blob.core.windows.net/container2?$STORAGE_ACCOUNT_2_SAS" \
--recursive --include-pattern "file*"



echo "All files copied from Storage Account A to B."
