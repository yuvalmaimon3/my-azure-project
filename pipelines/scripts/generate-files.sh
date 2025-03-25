#!/bin/bash

mkdir  ~/azure/my-azure-project/pipelines//temp_blobs

for i in {1..2}; do
    echo "This is file number $i" > ~/my-azure-project/pipelines/temp_blobs/file_$i.txt
done

echo "100 files created in temp_blobs directory."

