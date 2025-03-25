trigger:
- main

pool:
  name: Default

steps:
- script: |
    cd ~/my-azure-project/terraform
    terraform apply -auto-approve
  displayName: 'Run Terraform'
  continueOnError: false

- script: |
    chmod +x ~/my-azure-project/pipelines/scripts/generate-files.sh
    ~/my-azure-project/pipelines/scripts/generate-files.sh
  displayName: 'Generate Files'
  continueOnError: false

- script: |
    STORAGE_ACCOUNT_1=$(az deployment group show --resource-group yuval-rg --name storage-deployment --query properties.outputs.storageAccount1Name.value -o tsv)
    STORAGE_ACCOUNT_2=$(az deployment group show --resource-group yuval-rg --name storage-deployment --query properties.outputs.storageAccount2Name.value -o tsv)

    bash upload_and_copy.sh "$STORAGE_ACCOUNT_1" "$STORAGE_ACCOUNT_2"
  displayName: 'Upload and Copy Blobs'

- script: |
    rm -rf ~/my-azure-project/pipelines/temp_blobs/
  displayName: 'Delete Generated Files'
  continueOnError: false

- script: |
    DATE=$(date '+%Y-%m-%d %H:%M:%S')
    cd ~/my-azure-project
    git add .
    git commit -m "run $DATE"
    git push
  displayName: 'Update Git'
  continueOnError: false

- script: |
    if [ $? -ne 0 ]; then
      echo "Step failed at $(date '+%Y-%m-%d %H:%M:%S')" >> ~/my-azure-project/pipelines/log.txt
    fi
  displayName: 'Log Failures'

