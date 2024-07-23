#!/bin/bash

mpv \
--fullscreen \
--image-display-duration=5 \
--loop-playlist \
--no-osc \
--no-osd-bar \
--video-sync=display-resample \
/assets/data &

exit 0
