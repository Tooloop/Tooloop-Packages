#!/bin/bash

# move them to the repository
for folder in *; do
    if [ -d $folder ] && [ ${folder:0:1}  != "#" ]; then
        mv $folder/*.deb /assets/packages
    fi
done

# update local package repository
/opt/tooloop/scripts/tooloop-update-packages

# list available packages
apt list tooloop*
