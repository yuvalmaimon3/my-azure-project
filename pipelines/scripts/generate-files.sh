#!/bin/bash

mkdir  ~/azure/my-azure-project/pipeline/temp_blobs

for i in {1..100}; do
    echo "This is file number $i" > ~/azure/my-azure-project/pipeline/temp_blobs/file_$i.txt
done

echo "100 files created in temp_blobs directory."

