#!/bin/bash

# List of Chromium Command Line Switches
# https://peter.sh/experiments/chromium-command-line-switches/

COMMAND="chromium-browser \
--disable-features=Translate,Infobars \
--no-default-browser-check \
--no-first-run \
--noerrdialogs \
--class=TooloopOnboarding \
--app=file:///media/assets/data/index.html"

if [ $EUID == 0 ]; then
    /bin/bash /assets/presentation/stop-presentation.sh
    sleep 0.1
    su tooloop -c "$COMMAND" &
else
    /bin/bash /assets/presentation/stop-presentation.sh
    sleep 0.1
    $COMMAND &
fi

exit 0