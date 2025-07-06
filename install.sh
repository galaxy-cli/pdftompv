#!/bin/bash
#        _ __   __| |/ _| |_ ___  _ __ ___  _ ____   _____| |__
#       | '_ \ / _` | |_| __/ _ \| '_ ` _ \| '_ \ \ / / __| '_ \
#       | |_) | (_| |  _| || (_) | | | | | | |_) \ V /\__ \ | | |
#       | .__/ \__,_|_|  \__\___/|_| |_| |_| .__/ \_(_)___/_| |_|
#       |_|                                |_|
# https://github.com/galaxey-cli/pdftompv
# pdftompv.sh - PDF to MP3 converter utility using pdftotext, text2wave (Festival), LAME, and MPV

check_and_install_package() {
    pkg="$1"
    if ! dpkg -s "$pkg" &>/dev/null; then
        echo "Error: '$pkg' is required but not installed."
        read -p "Would you like to install it now? (y/n) " answer
        case "$answer" in
            y|Y|yes|YES)
                echo "Attempting to install $pkg..."
                if command -v apt-get &> /dev/null; then
                    sudo apt-get update && sudo apt-get install -y "$pkg"
                else
                    echo "Package manager not detected. Please install '$pkg' manually."
                    exit 1
                fi
                ;;
            *)
                echo "$pkg is required to run this script. Exiting."
                exit 1
                ;;
        esac
    fi
}
check_and_install_package poppler-utils

check_commands() {
    for cmd in  wget festival lame mpv; do
        if ! command -v "$cmd" &> /dev/null; then
            echo "Error: '$cmd' is required but not installed."
            read -p "Would you like to install it now? (y/n) " answer
            case "$answer" in
                y|Y|yes|YES)
                    echo "Attempting to install $cmd..."
                    if command -v apt-get &> /dev/null; then
                        sudo apt-get update && sudo apt-get install -y "$cmd"
                    else
                        echo "Package manager not detected. Please install '$cmd' manually."
                        exit 1
                    fi
                    ;;
                *)
                    echo "$cmd is required to run this script. Exiting."
                    exit 1
                    ;;
            esac
        fi
    done
}
check_commands
