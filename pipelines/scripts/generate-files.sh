#!/bin/bash
set -e

mkdir -p /home/yuval/my-azure-project/pipelines/temp_blobs

for i in {1..100}; do
    echo "This is file number $i" > /home/yuval/my-azure-project/pipelines/temp_blobs/file_$i.txt
done

echo "100 files created in temp_blobs directory."
