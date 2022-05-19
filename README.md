# Tooloop Packages

This repository contains presentations and addons, that come bundled with 
[Tooloop OS](https://github.com/Tooloop/Tooloop-OS).
It’s also a great place to get information on how to build your own package.


## Package format

Tooloop Packages are ZIP files, wrapping a Debian package and additional images, that are displayed in the [app center](https://github.com/Tooloop/Tooloop-Control):

    package.zip
    │
    ├─ <package-name>_v.v.v_aaa.deb (mandatory)
    │
    └─ media/
       ├─ <preview_image>.jpg (mandatory)
       ├─ <optional-image>.png
       ├─ <optional-image>.jpg
       └─ ...


## The Debian package


This is the folder structure:

```
│
├─ media/ (your image files)
│  ├─ some-image.jpg
│  └─ ...
│
package/ (the Debian package)
├─ DEBIAN/
│  ├─ control (mandatory)
│  ├─ postinst (optional)
│  ├─ postrm (optional)
│  └─ ...
│
└─ assets/
    ├─ presentation/
    │  ├─ LICENSE.md
    │  ├─ README.md
    │  ├─ start-presentation.sh (mandatory)
    │  ├─ stop-presentation.sh (mandatory)
    │  └─ ...
    │
    └─ data/
        └─ ...
```

The `/DEBIAN` folder contains the package information and some control files. All other folders are simply copied to disk for you.


**The DEBIAN/control file**

This file contains all the information about your package.
It’s used to display information in the app center.

https://linux.die.net/man/5/deb-control

```YAML
Package: my-app
# Use semantic versioning https://semver.org/
Version: 1.0.0
Maintainer: Tooloop Multimedia
Homepage: https://www.tooloop.de
Bugs: https://github.com/Tooloop/Tooloop-Packages
# One of "tooloop/presentation", "tooloop/addon"
Section: tooloop/presentation
Architecture: amd64
Depends: tooloop-transparent-cursor
# App name shown in the app center.
Name: My App
# The thumbnail shown in the app center
Thumbnail: my-app-thumbnail.jpg
# The media files, shown in the detail view of the package
# can be JPGs and PNGs
Media: my-app-image1.jpg, my-app-image2.png
# First line is the short description shown in the app center.
# All following lines are used as detailed description.
Description: A simple example, how to make a processing app
 Longer description, indented by one space
 .
 empty lines have just a single point
 *Markdown* _is_ ok
 ends with one additional line break

```

**Scripts**

You can add scripts in `DEBIAN` to further customize installation:

| script   | when                |
| -------- | ------------------- |
| preinst  | before installation |
| postinst | after installation  |
| prerm    | before removal      |
| postrm   | after removal       |

Use those to create folders, auto-generate files, cleanup, etc.


## Building and deploying your package

There scripts that you can use to build and deploy your package on a Tooloop OS Box. In fact, it’s these scripts that are used by the Tooloop OS installer.
Start by simply copying the `hello-world` folder and hack away from there.

1. Clone this repo on a Tooloop Box
2. Add your package folder (e. g. by copying the hello-world example)
3. Build packages
    ```bash
    ./build.sh
    ```
4. Deploy packages
    ```bash
    ./deploy.sh
    ```
5. Restart the control center  
    ```bash
    sudo systemctyl restart tooloop-control.service
    ```


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



## Links

**DEB packaging**

http://packaging.ubuntu.com/html/packaging-new-software.html
https://blog.serverdensity.com/how-to-create-a-debian-deb-package/
https://www.debian.org/doc/debian-policy/ch-binary.html