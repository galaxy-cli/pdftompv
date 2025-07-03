#!/bin/bash
#                  _  __ _                                 _  
#        _ __   __| |/ _| |_ ___  _ __ ___  _ ____   _____| |__ 
#       | '_ \ / _` | |_| __/ _ \| '_ ` _ \| '_ \ \ / / __| '_ \  
#       | |_) | (_| |  _| || (_) | | | | | | |_) \ V /\__ \ | | | 
#       | .__/ \__,_|_|  \__\___/|_| |_| |_| .__/ \_(_)___/_| |_|
#       |_|                                |_|
# https://github.com/galaxey-cli/pdftompv
# pdftompv.sh - PDF to MP3 converter utility using pdftotext, text2wave (Festival), LAME, and MPV

# Updates repos and installs relevant packages for pdftompv.sh
sudo apt install update
sudo apt install -y poppler-utils wget festival lame
