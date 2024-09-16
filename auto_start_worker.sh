#!/bin/bash
#
# README !!!
#
# This script opens a terminal and runs multiple Go services.
# The services are run in the following order:
#
# go run <service-name>.go
# github/rpc -> gitsyncer/rpc -> synchistory/rpc -> githublanguage/rpc -> repository/rpc ->commit/rpc ->
# gateway/api -> pullrequestreview/rpc -> pullrequestcommit/rpc -> pullrequest/rpc ->
# issue/rpc -> github/md
#
# How to use:
# 1. Open Terminal
# 2. Type "chmod +x auto_start_worker.sh" to make the file executable
# 3. Type "./auto_start_worker.sh" to start the services
#
# Note: You may need to install xdotool
# sudo apt-get install xdotool

# List of services to run
services=(
  "github/rpc github.go"
  "synchistory/rpc synchistory.go"
  "gitsyncer/rpc gitsyncer.go"
  "githublanguage/rpc githublanguage.go"
  "repository/rpc repository.go"
  "commit/rpc commit.go"
  "gateway/api gateway.go"
  "pullrequestreview/rpc pullrequestreview.go"
  "pullrequestcommit/rpc pullrequestcommit.go"
  "pullrequest/rpc pullrequest.go"
  "issue/rpc issue.go"
  "github/mq mq.go"
)


ProjectPath="/home/<PATH>"

if [ "$1" == "true" ]; then
  for i in {1..12}; do
    sleep 0.3
    xdotool key "Ctrl+Up"
    sleep 0.2
    xdotool key Ctrl+c
    sleep 0.2
    xdotool key Ctrl+l
    xdotool key Up
    xdotool key Return
  done
else

  # Run the services

  # Open Terminal, this is terminal default in Ubuntu
  gnome-terminal &

  # Run each service
  for index in "${!services[@]}"; do
    service=${services[$index]}
    path=$(echo $service | cut -d' ' -f1)
    file=$(echo $service | cut -d' ' -f2)

    # Execute Docker
    sleep 1
    xdotool type "docker exec -it project-worker-1 sh"
    xdotool key Return

    # Change directory to the specified path
    sleep 0.2
    xdotool type "cd $path"
    xdotool key Return

    # Run the service
    sleep 0.2
    xdotool type "go run $file"
    xdotool key Return

   
    sleep 0.3
    xdotool key Ctrl+t
    
  done

  # Maximize the terminal window
  xdotool windowsize $(xdotool getactivewindow) 100% 100%

  xdotool type "cd $ProjectPath"
  sleep 0.3
  xdotool key Return
  xdotool type "code ."
  sleep 0.2
  xdotool key Return
fi
