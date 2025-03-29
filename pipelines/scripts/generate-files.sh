#!/bin/bash
set -e

mkdir -p $WORK_DIR/pipelines/temp_blobs

for i in {1..100}; do
    echo "This is file number $i" > $WORK_DIR/pipelines/temp_blobs/file_$i.txt
done

echo "100 files created in temp_blobs directory."
