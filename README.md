# SETUP
* Use `chmod u+x pdftompv.sh` to make the script executable
* Use `./pdftompv.sh` to run script
# USAGE:
>  `pdftompv [OPTIONS] input`
# OPTIONS:
*  `--pdf`       Convert PDF file to MP3
*  `--open`      Open PDF file and play MP3
*  `--url`       Download PDF from URL before processing
# EXAMPLES:
>  `pdftompv --pdf book.pdf`
>  `pdftompv --url https://example.com/file.pdf --pdf`
>  `pdftompv --open book.pdf`
