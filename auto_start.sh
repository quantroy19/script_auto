#!/bin/bash

echo "Which script would you like to run?"
echo "1) auto_start_project.sh"
echo "2) auto_start_worker.sh"
echo "3) auto_start_personal.sh"
echo "4) Reboot"
echo "5) Power OFF"
read -p "Enter the number of your choice: " choice

case $choice in
  1)
    ~/Code/personal/script_auto/auto_start_project.sh
    ;;
  2)
    ~/Code/personal/script_auto/auto_start_worker.sh
    ;;
  3)
    ~/Code/personal/script_auto/auto_start_personal.sh
    ;;
  4)
    systemctl reboot -i
    ;;
  5)
    systemctl poweroff
    ;;
  *)
    echo "Invalid choice. Please enter a number between 1 and 5."
    ;;
esac
