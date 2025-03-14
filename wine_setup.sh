#!/bin/bash
#LOGFILE="/tmp/wine_prefix_wizard.log"
#exec 2> >(tee -a "$LOGFILE")
#exec > >(tee -a "$LOGFILE")
#set -x  # Optional: enables debugging output

# Title and Menu description
DIALOG_TITLE="Wine Utilities"
DIALOG_MENU="Select a wizard to launch:"

# Menu options
OPTIONS=(1 "64-bit Box64 Wine Prefix Wizard"
         2 "32-bit Box86 Wine Prefix Wizard"
         3 "Wine 64-bit build Custom Downloader"
         4 "Wine 32-bit build Custom Downloader")

# Display the menu
CHOICE=$(dialog --clear --title "$DIALOG_TITLE" --menu "$DIALOG_MENU" 15 50 2 "${OPTIONS[@]}" 2>&1 >/dev/tty)

# Clear the dialog screen
clear

# Execute the selected option
case $CHOICE in
    1)
        echo "Launching 64-bit Box64 Wine Prefix Wizard..."
        curl -L https://github.com/trashbus99/Rocknix-WINE/raw/main/64bit.sh | bash
        ;;
    2)
        echo "Launching 32-bit Box64 Wine Prefix Wizard..."
        curl -L https://github.com/trashbus99/Rocknix-WINE/raw/main/32bit.sh | bash
        ;;   
    3)
       echo "Launching custom wine downloader..."
       curl -L https://github.com/trashbus99/Rocknix-WINE/raw/main/custom.sh | bash
       ;;
    4)
       echo "Launching custom32 wine downloader..."
       curl -L https://github.com/trashbus99/Rocknix-WINE/raw/main/custom32.sh | bash
       ;;
    *)
        echo "No option selected. Exiting."
        ;;
esac
