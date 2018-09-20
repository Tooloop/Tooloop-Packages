# DEB packaging store

http://packaging.ubuntu.com/html/packaging-new-software.html
https://blog.serverdensity.com/how-to-create-a-debian-deb-package/
https://www.debian.org/doc/debian-policy/ch-binary.html


## Creating a package

**Debian package**

Create a folder structure with your stuff:

    package/
    │
    ├─ DEBIAN/
    │  ├─ control (mandatory)
    │  ├─ postinst (mandatory)
    │  ├─ postrm (mandatory)
    │  └─ ...
    │
    ├─ assets/
    │  ├─ presentation/
    │  │  ├─ LICENSE.md
    │  │  ├─ README.md
    │  │  ├─ start-presentation.sh (mandatory)
    │  │  ├─ stop-presentation.sh (mandatory)
    │  │  └─ ...
    │  │
    │  └─ data/
    │     └─ ...
    │
    └─ opt/
       └─ tooloop/
          └─ settings─server/
             └─ installed_app/
                ├─ controller.py
                └─ settings.html
     

The `DEBIAN` contains the package information and some control files.
All other folders except simply copied to disk for you.


**The DEBIAN/control file**

https://linux.die.net/man/5/deb-control

    Package: tooloop-processing-example
    # Use semantic versioning https://semver.org/
    Version: 0.9.0
    Maintainer: vollstock <daniel@vollstock.de>
    Homepage: https://www.vollstock.de
    Bugs: https://github.com/vollstock/Tooloop-Examples
    # One of "tooloop/presentation", "tooloop/addon"
    Section: tooloop/presentation
    # One of "amd64", "armvl7", "all"
    Architecture: amd64
    Depends: tooloop-processing tooloop-processing (= 3.4.0)
    # App name shown in the app center.
    Name: Processing Example
    # First line is the short description shown in the app center.
    # All following lines are used as detailed description.
    Description: A simple example, how to make a processing app
     Longer description…


**Scripts**

You can add scripts in `DEBIAN` to further customize installation:

|  script  |         when        |
|----------|---------------------|
| preinst  | before installation |
| postinst | after installation  |
| prerm    | before removal      |
| postrm   | after removal       |

The scripts can be used to e. g. reload the settings server:

    #!/bin/bash
    set -e
    systemctl restart tooloop-settings-server
    exit 0


**Building the Debian package**

    dpkg --build packagefolder packagename_version_architecture.deb

e.g.

    dpkg --build kiosk-browser tooloop-processing-example_0.9.0_amd64.deb



**Packaging for Tooloop**

    package_name/
    │
    ├─ package/
    │  └─ ...
    │
    └─ media/
       ├─ preview_image.jpg (mandatory)
       ├─ <packagename>_1.png
       ├─ <packagename>_2.jpg
       └─ ...

media: png or jpg
preview_image.xxx: thumbnail
<packagename>xxxxx: app center media

ZIP it



## Setting up the local .deb repository

https://askubuntu.com/questions/170348/how-to-create-a-local-apt-repository#176546

Create a packages directory and a dirctory where installed addons will live in:

    mkdir /assets/packages /assets/addons
    chown -R tooloop:tooloop /assets

Add `.keep` files so apt will not remove folders when purging packages:

    touch /assets/addons/.keep
    touch /assets/presentation/.keep
    touch opt/tooloop/settings─server/installed_app/.keep

Create a script that will scan packages and create a RELEASE file apt-get update can read

`/opt/tooloop/scripts/update-tooloop-packages`

    #! /bin/bash
    
    cd /assets/packages
    
    # Generate the Packages file
    dpkg-scanpackages . /dev/null > Packages
    gzip --keep --force -9 Packages
    
    # Generate the Release file
    cat conf/distributions > Release
    # The Date: field has the same format as the Debian package changelog entries,
    # that is, RFC 2822 with time zone +0000
    echo -e "Date: `LANG=C date -Ru`" >> Release
    # Release must contain MD5 sums of all repository files (in a simple repo just the Packages and Packages.gz files)
    echo -e 'MD5Sum:' >> Release
    printf ' '$(md5sum Packages.gz | cut --delimiter=' ' --fields=1)' %16d Packages.gz' $(wc --bytes Packages.gz | cut --delimiter=' ' --fields=1) >> Release
    printf '\n '$(md5sum Packages | cut --delimiter=' ' --fields=1)' %16d Packages' $(wc --bytes Packages | cut --delimiter=' ' --fields=1) >> Release
    # Release must contain SHA256 sums of all repository files (in a simple repo just the Packages and Packages.gz files)
    echo -e '\nSHA256:' >> Release
    printf ' '$(sha256sum Packages.gz | cut --delimiter=' ' --fields=1)' %16d Packages.gz' $(wc --bytes Packages.gz | cut --delimiter=' ' --fields=1) >> Release
    printf '\n '$(sha256sum Packages | cut --delimiter=' ' --fields=1)' %16d Packages' $(wc --bytes Packages | cut --delimiter=' ' --fields=1) >> Release
    
    # Get apt to see the changes
    sudo apt-get update


## Useful commands

Install package

    sudo apt install --allow-unauthenticated <PACKAGE>

Remove package

    sudo apt purge <PACKAGE> && sudo apt autoremove

List installed

    apt list --installed tooloop*

List available

    apt list tooloop*

Search packages in section `tooloop`

    aptitude -F'|%p|%d|' search '?section(tooloop/addon)'

https://askubuntu.com/a/473511/873460



