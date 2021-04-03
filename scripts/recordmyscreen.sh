#!/bin/bash

OUTFL="$1"

ffmpeg -video_size 1366x768 -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i 0 $OUTFL.mp4

