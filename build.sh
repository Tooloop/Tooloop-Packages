#!/bin/bash

set -e

# build packages
for folder in *; do
    if [ -d $folder ] && [ ${folder:0:1}  != "#" ]; then
        cd $folder

        # Get package infos
        package="$(cat package/DEBIAN/control | grep 'Package: ')"
        arch="$(cat package/DEBIAN/control | grep 'Architecture: ')"
        version="$(cat package/DEBIAN/control | grep 'Version: ')"
        packagename="${package#*: }_${version#*: }_${arch#*: }"
        
        # Build Debian package
        dpkg --build package $packagename.deb
        
        # Bundle it with media files for the Tooloop app center
        zip -9 --exclude=*package* ../$packagename.zip $packagename.deb media/*

        cd ..
    fi
done
