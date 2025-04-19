#!/bin/bash
#################
#               #
#  pdftompv.sh  #
#               #
#################

#
# Google Search `filetype: pdf` to find pdf to read
#

case "$1" in

	--pdf)

		trap 'rm -f "$txt"' INT EXIT

		pdf="$2"

		txt="${pdf%.*}"

		if [[ "$pdf" = *.pdf ]]; then

			pdftotext -raw "$pdf" "$txt"

			text2wave "$txt" | lame - "$txt.mp3"
		else

			printf "Use a vaild PDF file\n"
		fi
	;;

	--open)

		if [[ "$2" = *.pdf && "$3" = *.mp3 ]] then

			open "$2" && mpv "$3"

		else

			echo "USAGE: pdftompv --open [PDF] [MP3]"

		fi
	;;

	*)

		echo "USAGE:"

		echo "pdftompv --pdf [PDF]"

                echo "pdftompv --open [PDF] [MP3]"

esac
