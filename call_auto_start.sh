#!/bin/bash

terminator&!
sleep 1

xdotool type "/home/<PATH>/script_auto/auto_start.sh"
xdotool key Return
