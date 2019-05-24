#!/bin/bash

# move them to the repository
for archive in *; do
    # if [ -d $folder ] && [ ${folder:0:1}  != "#" ]; then
    #     mv $folder/*.deb /assets/packages
    # fi
    if [[ $archive =~ \.zip$ ]] && [ ${archive:0:1}  != "#" ]; then
        unzip -o $archive -d /assets/packages/
    fi
done

# update local package repository
#/opt/tooloop/scripts/tooloop-update-packages

# list available packages
#apt list tooloop*

tree /assets/packages/
