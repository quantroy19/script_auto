#!/bin/bash
terminator&!
sleep 1

xdotool type "<PATH_TO>/auto_start.sh"
xdotool key Return
