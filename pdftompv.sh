#!/bin/bash
#                  _  __ _                                 _ 
#        _ __   __| |/ _| |_ ___  _ __ ___  _ ____   _____| |__ 
#       | '_ \ / _` | |_| __/ _ \| '_ ` _ \| '_ \ \ / / __| '_ \ 
#       | |_) | (_| |  _| || (_) | | | | | | |_) \ V /\__ \ | | |
#       | .__/ \__,_|_|  \__\___/|_| |_| |_| .__/ \_(_)___/_| |_|
#       |_|                                |_|
# https://github.com/galaxey-cli/pdftompv
# pdftompv.sh - PDF to MP3 converter utility using pdftotext, text2wave (Festival), LAME, and MPV

# Dependency checks
for cmd in pdftotext text2wave lame mpv open; do
    command -v "$cmd" >/dev/null 2>&1 || { echo "$cmd not found"; exit 1; }
done

print_usage() {
    cat <<EOF
USAGE
  pdftompv.sh --pdf [PDF]        # Convert PDF to MP3
  pdftompv.sh --open [PDF] [MP3] # Open PDF and play MP3

FLAGS
  --pdf   Convert PDF to MP3
  --open  Open PDF and play MP3
EOF
}

convert_pdf_to_mp3() {
    pdf="$1"
    if [[ ! -f "$pdf" || "${pdf##*.}" != "pdf" ]]; then
        echo "Please provide a valid PDF file."
        exit 1
    fi

    txt=$(mktemp /tmp/pdftompv.XXXXXX.txt)
    mp3="${txt%.txt}.mp3"
    trap 'rm -f "$txt" "$mp3"' INT EXIT

    pdftotext -raw "$pdf" "$txt" || { echo "pdftotext failed"; exit 1; }
    text2wave "$txt" | lame - "$mp3" || { echo "Conversion to MP3 failed"; exit 1; }
    echo "MP3 created: $mp3"
}

open_pdf_and_mp3() {
    pdf="$1"
    mp3="$2"
    if [[ ! -f "$pdf" || "${pdf##*.}" != "pdf" ]]; then
        echo "First argument must be a PDF file."
        exit 1
    fi
    if [[ ! -f "$mp3" || "${mp3##*.}" != "mp3" ]]; then
        echo "Second argument must be an MP3 file."
        exit 1
    fi
    open "$pdf" &
    mpv "$mp3"
}

case "$1" in
    --pdf)
        if [[ -z "$2" ]]; then
            print_usage
            exit 1
        fi
        convert_pdf_to_mp3 "$2"
        ;;
    --open)
        if [[ -z "$2" || -z "$3" ]]; then
            print_usage
            exit 1
        fi
        open_pdf_and_mp3 "$2" "$3"
        ;;
    *)
        print_usage
        ;;
esac
