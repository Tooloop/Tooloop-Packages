#!/bin/bash

pids=$(xdotool search --class "TooloopOnboarding")
for pid in $pids; do
    xkill -id $pid
    break
done

exit 0
