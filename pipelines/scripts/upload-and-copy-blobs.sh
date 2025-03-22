TORAGE_ACCOUNT_A="yourstorageaccounta"
STORAGE_ACCOUNT_B="yourstorageaccountb"
CONTAINER_A="container-a"
CONTAINER_B="container-b"
RESOURCE_GROUP="your-resource-group"

az login --identity  # אם משתמשים ב-Managed Identity
az storage container create --name $CONTAINER_A --account-name $STORAGE_ACCOUNT_A
az storage container create --name $CONTAINER_B --account-name $STORAGE_ACCOUNT_B

for file in temp_blobs/*; do
	    filename=$(basename "$file")
	        az storage blob upload --account-name $STORAGE_ACCOUNT_A --container-name $CONTAINER_A --name $filename --file $file --auth-mode login
	done

	echo "All files uploaded to Storage Account A."

	for file in temp_blobs/*; do
		    filename=$(basename "$file")
		        az storage blob copy start --source-account-name $STORAGE_ACCOUNT_A --source-container $CONTAINER_A --source-blob $filename --destination-account-name $STORAGE_ACCOUNT_B --destination-container $CONTAINER_B --destination-blob $filename
		done

		echo "All files copied from Storage Account A to B."

