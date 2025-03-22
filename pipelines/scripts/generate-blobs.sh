     #!/bin/bash

     mkdir -p temp_blobs

     for i in {1..100}; do
	         echo "This is file number $i" > temp_blobs/file_$i.txt
	 done

	 echo "100 files created in temp_blobs directory."

