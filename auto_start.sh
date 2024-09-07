#!/bin/bash

echo "Which script would you like to run?"
echo "1) auto_start_project.sh"
echo "2) auto_start_worker.sh"
read -p "Enter the number of your choice: " choice

case $choice in
  1)
    ./auto_start_project.sh
    ;;
  2)
    ./auto_start_worker.sh
    ;;
  *)
    echo "Invalid choice. Please run the script again and select either 1 or 2."
    ;;
esac
