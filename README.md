# pdftompv

A high-performance Linux utility to download, convert, and listen to PDF documents as high-quality AI audiobooks using Microsoft Edge's Neural TTS and MPV.

## Features

* **Neural AI Voices:** Uses Microsoft Edge's "Neural" TTS for natural-sounding, human-like narration (far superior to legacy engines like Festival).
* **High-Capacity Stability:** Automatically chunks long documents (500+ pages) to prevent API timeouts and memory errors.
* **Smart Text Cleaning:** Strips unnecessary PDF line breaks and dramatic punctuation pauses for a smoother listening flow.
* **Read-Along Experience:** Opens `evince` and `mpv` simultaneously so you can follow the text while listening.
* **Integrated Timer:** Displays per-chunk processing times and total conversion duration using `pv`.
* **Automatic Cleanup:** Self-cleaning logic ensures temporary text and audio chunks are deleted upon completion or interruption.

## Installation

1. Save the script as `pdftompv`.
2. Make it executable:
```
chmod +x pdftompv
```
3. (Optional) Move it to your path:
```
sudo mv pdftompv /usr/local/bin/
```

## Usage
```
pdftompv [OPTION] [URL | PDF]
```

## Options
| Option | Description
| --- | ---
| `--pdf` | Convert a local PDF file to a Neural AI MP3
| `--url` | Download a PDF from a URL (best used with --pdf)
| `--open` | Open the PDF in a viewer and play the generated audiobook
| `--help` |	Show the help menu




| Option | Description |
|---|---|
| `--pdf` | Convert a local PDF file to MP3 |
| `--url `| Download a PDF from a URL (best used with `--pdf`) |
| `--open` | Open the PDF in a viewer and play the audiobook |
| `--help` | Show the help menu |