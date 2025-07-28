# pdftompv

A simple **PDF to MP3 converter utility** using `pdftotext` (from poppler-utils), `text2wave` (Festival TTS engine), `LAME` MP3 encoder, and `MPV` media player.

---

## Features

- Convert PDF documents to MP3 audio files
- Download PDF files from URLs prior to conversion
- Open and play both PDF and generated MP3 files directly
- Interactive prompts to install missing dependencies on Debian-based systems
- Lightweight and easy-to-use command-line interface

---

## Dependencies

This script requires the following tools:

- [`poppler-utils`](https://poppler.freedesktop.org/) (for `pdftotext`)
- [`festival`](http://festival.org.uk/) (for text-to-speech synthesis)
- [`lame`](https://lame.sourceforge.io/) (MP3 encoder)
- [`mpv`](https://mpv.io/) (media player)
- [`wget`](https://www.gnu.org/software/wget/) (for downloading PDFs)
- Standard Linux utilities (`xdg-open` or `open` for opening files)

The script checks for these dependencies and offers to install any missing ones on Debian/Ubuntu systems using `apt-get`.

---

## Installation

On Debian/Ubuntu, install dependencies manually if needed:

```
sudo apt-get update
sudo apt-get install -y poppler-utils festival lame mpv wget
```

---

## Usage

`pdftompv [OPTIONS] input`

### Options

| Option   | Description                                |
| -------- | ------------------------------------------ |
| `--pdf`  | Convert the specified PDF file to MP3     |
| `--open` | Open the PDF file and play the MP3 output |
| `--url`  | Download PDF from the specified URL before processing |

---

### Examples

- Convert a local PDF file to MP3:

`pdftompv --pdf book.pdf`

- Download a PDF from a URL and convert to MP3:

`pdftompv --url https://example.com/sample.pdf --pdf`

- Open a PDF file and play its corresponding MP3 audio:

`pdftompv --open book.pdf`

---

## How It Works

1. **Dependency Check:** The script checks that required packages (`poppler-utils`, `festival`, `lame`, `mpv`, `wget`) are installed, prompting to install missing packages on Debian-based systems.

2. **PDF Download:** If `--url` is specified, the script downloads the PDF file from the provided URL.

3. **PDF to Text:** Uses `pdftotext` to extract raw text from the PDF.

4. **Text to Speech:** Converts the extracted text to WAV audio using Festival’s `text2wave` utility.

5. **MP3 Encoding:** Encodes the WAV audio into MP3 format using LAME.

6. **Play and Open:** If requested, opens the PDF file (using `xdg-open` or `open`) and plays the MP3 with MPV.

---

## Notes

- The MP3 file will be saved with the same base filename as the PDF but with the `.mp3` extension.
- The script traps and cleans up temporary text files after conversion.
- The `--open` flag requires the presence of both PDF and MP3 files.
- For non-Debian systems, manual installation of dependencies is required.

---
## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Author & Contact

**galaxy-cli**

GitHub: [https://github.com/galaxy-cli/pdftompv](https://github.com/galaxy-cli/pdftompv
