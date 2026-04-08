# pdftompv
A lightweight Linux utility to download, convert, and listen to PDF documents as audiobooks using the Festival speech engine and MPV.
## Features

* URL Support: Download PDFs directly from the web.
* Optimized TTS: Uses text2wave and lame for high-speed speech encoding.
* Smart Logic: Automatically pairs PDFs with their MP3 counterparts.
* Foreground Reading: Opens evince and mpv simultaneously for a read-along experience.
* Dependency Management: Automatically checks for and offers to install required tools.

## Installation

   1. Save the script as pdftompv.
   2. Make it executable:
```
chmod +x pdftompv
```
   
   3. (Optional) Move to your path:  
```
sudo mv pdftompv /usr/local/bin/
```
   
   
## Usage

`pdftompv [OPTION] [URL | PDF]`
## Options

| Option | Description |
|---|---|
| `--pdf` | Convert a local PDF file to MP3 |
| `--url `| Download a PDF from a URL (best used with `--pdf`) |
| `--open` | Open the PDF in a viewer and play the audiobook |
| `--help` | Show the help menu |

## Examples
```
# Convert a local book
pdftompv --pdf book.pdf
# Download and convert a web PDF
pdftompv --url https://example.com --pdf
# Listen and read along
pdftompv --open book.pdf
```
## Dependencies
The script will prompt you to install these via apt if missing:

* `poppler-utils` (`pdftotext`)
* `festival`
* `lame`
* `mpv`
* `evince`
* `pv`
* `wget`