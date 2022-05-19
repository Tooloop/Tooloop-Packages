#!/bin/bash

URL="/media/assets/data/index.html"

# List of Chromium Command Line Switches
# https://peter.sh/experiments/chromium-command-line-switches/
COMMAND="chromium-browser \
--kiosk \
--bwsi \
--overscroll-history-navigation=1 \
--incognito \
--disable-infobars \
--disable-translate \
--no-default-browser-check \
--no-first-run \
--disable-translate-new-ux \
--num-raster-threads=4 \
--enable-zero-copy \
--noerrdialogs \
--class=TooloopKiosk \
$URL"

killall chrome
sleep 0.1

if [ $EUID == 0 ]; then
    su tooloop -c "$COMMAND" &
else
    $COMMAND &
fi

exit 0
