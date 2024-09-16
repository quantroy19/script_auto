#!/bin/bash

ProjectPath="/home/<PATH>"

gnome-terminal &

xdotool type "cd $ProjectPath"
sleep 0.3
xdotool key Return
xdotool type "code ."
sleep 0.2
xdotool key Return
