#!/bin/bash

URL="http://127.0.0.1:8080"

# List of Chromium Command Line Switches
# https://peter.sh/experiments/chromium-command-line-switches/

COMMAND="chromium-browser \
--kiosk \
--bwsi \
--overscroll-history-navigation=1 \
--incognito \
--disable-features=Translate,Infobars \
--no-default-browser-check \
--no-first-run \
--noerrdialogs \
--num-raster-threads=8 \
--enable-zero-copy \
--class=TooloopKiosk \
$URL"

if [ $EUID == 0 ]; then
    pkill chrome
    sleep 0.1
    su tooloop -c "$COMMAND" &
else
    pkill chrome
    sleep 0.1
    $COMMAND &
fi

exit 0
