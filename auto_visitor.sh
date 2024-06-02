#!/bin/bash
# README !!!
# This script will open Firefox browser and visit the URL
# It is useful when you want to visit a website quickly
# without having to type the URL manually.
#
#
# URL is the link to the website you want to visit
# You need to change the value of URL to the link of the website
#  
# How to use:
# 1. Open Terminal
# 2. Type "chmod +x auto_visitor.sh" to make the file executable
# 3. Type "./auto_visitor.sh" to visit the website
# 
# Note: You may need to install xdotool and Firefox
# sudo apt-get install xdotool
# sudo apt-get install firefox

URL="https://viblo.asia/p/2oKLnGKQVQO"

open Firefox browser and background the process
firefox &!

# wait for 1 second
sleep 1

xdotool type --delay 100 $URL 
xdotool key Return

# wait for 5 seconds
sleep 3

# Scroll down
xdotool key Page_Down
sleep 1
xdotool key Page_Down
sleep 1
xdotool key Page_Down
