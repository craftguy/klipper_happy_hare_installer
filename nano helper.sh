#!/bin/bash

set -e
clear

INSTALLER_FOLDER="$( cd "$( dirname "${0}" )" && pwd )"
for script in "${INSTALLER_FOLDER}/scripts/"*.sh; do . "${script}"; done

function update_installer() {
  echo "Info: Updating Installer Script..."
  cd "${INSTALLER_FOLDER}"
  git reset --hard && git pull
  echo "Installer Script has been updated!"
  echo "Please restart script to load the new version."
  exit 0
}

# Main menu loop
while true; do
    show_menu
    read -p "Enter your choice: " choice
    case $choice in
        1) update_system ;;
        2) install_dependencies ;;
        3) remove_dependencies ;;
        4) clone_klipper ;;
        5) remove_klipper ;;
        6) install_klipper ;;
        7) remove_klipper_build ;;
        8) install_klipper_service ;;
        9) remove_klipper_service ;;
        10) extract_happy_hare ;;
        11) remove_happy_hare ;;
        12) install_happy_hare ;;
        13) remove_happy_hare_installation ;;
        14) reboot_system ;;
        15) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice, please try again." ;;
    esac
done
