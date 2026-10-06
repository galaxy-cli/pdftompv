# pdftompv

A command-line tool that converts PDF documents into AI-narrated MP3
audiobooks, using `pdftotext` for extraction and Microsoft Edge's neural
text-to-speech engine (`edge-tts`) for narration. It can also open a PDF
and its matching audio track side by side, so you can read along while
listening.

## Features

- **Parallel rendering**: splits the extracted text into chunks and
  synthesizes them concurrently (scaled to your CPU core count), with
  automatic retries on a chunk that fails.
- **Live progress**: a single-line, in-place status display showing
  elapsed time and how many chunks have completed.
- **Synchronized playback**: `--open` on a non-PDF/MP3 target launches the
  PDF in your document viewer and the audiobook in `mpv` together.
- **Clipboard-aware URL input**: `--url` with no link reads a URL straight
  from your clipboard (works on X11, Wayland, and macOS).
- **Dependencies installed on demand**: each tool (`pdftotext`, `edge-tts`,
  `wget`, `mpv`, `evince`) is only checked for and offered for install the
  first time an operation actually needs it — not all five up front.

## Requirements

Installed automatically on first use (you'll be prompted via `apt`), or
install ahead of time:

```bash
sudo apt update && sudo apt install poppler-utils wget mpv evince pipx
pipx ensurepath
```

| Tool | Needed for |
|---|---|
| `poppler-utils` (`pdftotext`) | `--pdf` (text extraction) |
| `pipx` + `edge-tts` | `--pdf`, and a standalone `--voice` preview |
| `wget` | `--url` (downloading) |
| `evince` | `--open` on a `.pdf` or wildcard target |
| `mpv` | `--open` on a `.mp3` or wildcard target, and voice previews |

## Installation

```bash
chmod +x pdftompv
mv pdftompv ~/.local/bin/
```
(or symlink it there if you're keeping the script elsewhere)

## Usage

```text
Usage: pdftompv [OPTION]... [URL | TARGET]
Options:
  --pdf              Convert PDF to MP3
  --open             Launch file based on extension (.pdf, .mp3, or .*)
  --voice            Set neural voice
  --url [LINK]       Download PDF (reads clipboard if LINK is omitted)
  --version          List script version
  --help             List help menu
```

### How a target resolves

| Target | Mode | `--open` behavior |
|---|---|---|
| `book.pdf` (or a name with no extension at all) | pdf | Opens the PDF in evince |
| `book.mp3` | mp3 | Plays the MP3 in mpv |
| `book.epub`, a URL, or anything else with a different extension | wildcard | Opens the matching `.pdf` in evince (if present) *and* plays the matching `.mp3` in mpv, together |

`--pdf` always converts `<base>.pdf` → `<base>.mp3` regardless of mode, so
the wildcard/no-extension cases just determine what `--open` launches.

## Examples

**Download, convert, and read-along in one step:**
```bash
pdftompv --url https://example.com/document.pdf --pdf --open
```

**Same, but grab the link from your clipboard** (copy a PDF link first):
```bash
pdftompv --url --pdf --open
```

**Convert a local PDF with a specific voice:**
```bash
pdftompv --pdf --voice en-US-GuyNeural my_book.pdf
```

**Just listen to an already-converted audiobook:**
```bash
pdftompv --open my_book.mp3
```

**Preview a voice without converting anything:**
```bash
pdftompv --voice en-US-GuyNeural
```

**Browse available voices:**
```bash
pdftompv --voice
```

## Notes

- Ctrl+C at any point cancels cleanly — temp files are removed and the
  document viewer is closed automatically.
- The final MP3 is written alongside the source PDF as `<name>.mp3`.
