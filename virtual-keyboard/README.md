# On-Screen keyboard

    sudo apt install onboard dbus-x11

## Config

/usr/share/onboard/onboard-defaults.conf

wird aber nur einmal geladen, deshalb müssen alle Settinngs per gsettings geschriebene werden (https://answers.launchpad.net/onboard/+question/661251)

Alle Settings sind deshalb in

    /home/tooloop/.config/onboard/onboard-config.sh

muss nur einmal aufgerufen werden

## Start

    # set keyboard layout
    # https://answers.launchpad.net/onboard/+question/235265
    setxkbmap de && onboard &
