#!/bin/bash

# README !!!
# This script will open Terminator and start the project
# Split terminal, then start a shell inside both Docker Node.js and PHP containers.
# Finally, it will open Chrome browser and select the profile
# This script is useful when you want to start the project quickly
# without having to type the commands manually
# 
# 
# ProjectPath is the path to your project
# You need to change the value of ProjectPath to the path of your project
# 
# How to use:
# 1. Open Terminal
# 2. Type "chmod +x auto_start_project.sh" to make the file executable
# 3. Type "./auto_start_project.sh" to start the project
# 
# Note: You may need to install xdotool and terminator
# sudo apt-get install xdotool
# sudo apt-get install terminator


ProjectPath="/home/<PATH>"

#open Terminal and background the process
terminator&!
# wait for 1 second
sleep 1

# cd to the project
xdotool type "cd $ProjectPath"  
xdotool key Return
sleep 0.5
# start the project
xdotool type "make devrun"
xdotool key Return

sleep 0.5

# Split the terminal horizontal 
xdotool key Ctrl+Shift+O
xdotool type "make devshnode"
xdotool key Return
xdotool key Ctrl+l

sleep 1
# Split the terminal vertical
xdotool key Ctrl+Shift+E

sleep 1
xdotool key Ctrl+Tab

sleep 1
xdotool key Ctrl+Shift+E
xdotool type "make devshphp"
xdotool key Return
xdotool key Ctrl+L

sleep 1
# Maximize the terminal window
xdotool windowsize $(xdotool getactivewindow) 100% 100%

# open Chrome browser and background the process
google-chrome&!
sleep 1

# select Chrome profile
xdotool mousemove 1580 1215 click 1
