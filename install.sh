#!/bin/bash
#                  _  __ _                                 _       _                         _                             _ _ 
#        _ __   __| |/ _| |_ ___  _ __ ___  _ ____   _____| |__   | |__  _   _    __ _  __ _| | __ ___  ___   _        ___| (_)
#       | '_ \ / _` | |_| __/ _ \| '_ ` _ \| '_ \ \ / / __| '_ \  | '_ \| | | |  / _` |/ _` | |/ _` \ \/ / | | |_____ / __| | |
#       | |_) | (_| |  _| || (_) | | | | | | |_) \ V /\__ \ | | | | |_) | |_| | | (_| | (_| | | (_| |>  <| |_| |_____| (__| | |
#       | .__/ \__,_|_|  \__\___/|_| |_| |_| .__/ \_(_)___/_| |_| |_.__/ \__, |  \__, |\__,_|_|\__,_/_/\_\\__, |      \___|_|_|
#       |_|                                |_|                           |___/   |___/                    |___/
# https://github.com/galaxey-cli/pdftompv
# pdftompv.sh - PDF to MP3 converter utility using pdftotext, text2wave (Festival), LAME, and MPV

# Updates repos and installs relevant packages for pdftompv.sh
sudo apt install update
sudo apt install -y poppler-utils wget festival lame
