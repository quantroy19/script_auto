#!/bin/bash

# Source the .env file to load environment variables
if [ -f .env ]; then
  export $(cat .env | xargs)
else
  echo ".env file not found. Please create a .env file with the required environment variables."
  exit 1
fi

terminator&!
sleep 1

xdotool type "$AUTO_START_FILE_PATH"
xdotool key Return
