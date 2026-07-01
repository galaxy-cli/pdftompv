# pdftompv

`pdftompv` is a lightweight, high-performance command-line utility written in Bash that downloads, parallel-processes, and converts PDF documents into high-quality AI audiobooks using Microsoft Edge's Neural Text-to-Speech engine (`edge-tts`). 

It natively supports synchronized dual-reading by opening your system's document viewer (`evince`) alongside your terminal media player (`mpv`) with a built-in live tracking progress engine.

## Features

*   **Parallel Acceleration:** Automatically scales across multiple CPU cores to render large books concurrently instead of one section at a time.
*   **Live Status Monitor:** Displays a dynamic, in-place terminal timer showing compilation elapsed time and chunk completion rates.
*   **Synchronized Playback:** Launches parallel visual and audio tracks simultaneously using wildcard selections.
*   **Clipboard Integration:** Sniffs links or target tracks directly out of your X11, Wayland, or macOS system clipboards natively.
*   **Resilient API Architecture:** Implements connection throttling and localized fallback loops to bypass API speed bans.

## Requirements & Dependencies

The script works on Linux (Ubuntu/Debian layout defaults below) and macOS. It uses native platform packages alongside Python:

```bash
# Install core system dependencies on Ubuntu/Debian
sudo apt update && sudo apt install poppler-utils wget mpv evince pipx

# Ensure pipx is in your command path
pipx ensurepath
```
*Note: The script safely checks for and attempts to auto-install missing system dependencies interactively upon its initial boot cycle.*

## Installation

1. Copy the bash script text into a local file named `pdftompv`.
2. Move it to a secure binary execution path and grant it terminal runtime credentials:

```bash
chmod +x pdftompv
sudo mv pdftompv ~/./local/bin/
```

## Usage Instructions

```text
Usage: pdftompv [OPTION]... [URL | TARGET]
Download, convert, and listen to PDFs as high-quality AI audiobooks.

Options:
  --pdf              Convert input PDF document to MP3 file
  --open             Launch targets based on the specific suffix type
  --voice            Choose neural voice
  --url [LINK]       Download PDF from web before processing (reads clipboard if LINK is omitted)
  --version          Output version information and exit
  --help             Display this help menu and exit
```

### Targeted Suffix Requirements (`--open` layouts)
*   `filename.pdf` $\rightarrow$ Launches the visual layout document reader **only**.
*   `filename.mp3` $\rightarrow$ Plays the audio track sequence inside `mpv` **only**.
*   `filename.` *(Trailing Dot Wildcard)* $\rightarrow$ Launches layout layout and audio **simultaneously**.

---

## Practical Examples

### 1. Download, Convert, and Read a Web PDF Synchronously
Fetches a remote document, converts the pages in parallel, opens Evince, and begins playing the audio:
```bash
pdftompv --url https://example.com/document.pdf --pdf --open
```

### 2. Auto-Extract a Web Link From Your Clipboard
Omit the link after `--url` to pull a PDF URL directly out of your copy history buffer:
```bash
pdftompv --url --pdf --open
```

### 3. Change Voice Engines and Play Audio Only
Listen to an already-generated local audiobook track with a custom neural voice profile:
```bash
pdftompv --voice en-US-GuyNeural --open my_book.mp3
```

### 4. Reopen Both Layout and Audio Tracks for an Existing File
Uses the shorthand trailing dot shortcut to launch the media player locked into lockstep with the text layout:
```bash
pdftompv --open my_book.
```