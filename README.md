# pdftompv

`pdftompv` is a lightweight, zero-overhead POSIX-compliant CLI utility designed to transform PDFs into high-quality AI-narrated audiobooks. By leveraging `pdftotext` for processing extraction, Microsoft’s Neural TTS engine (`edge-tts`), and `mpv` for playback control, it delivers a hands-free reading workflow directly in your terminal.

## Key Features

* **High-Quality Neural Voices**: Utilizes modern AI text-to-speech engine outputs (`edge-tts`) instead of robotic legacy TTS tools.
* **Large Document Stability**: Automatically slices massive text structures (500+ pages) into transient chunks to ensure uninterrupted processing.
* **Smart UI Thread Tracking**: Synchronizes visual viewing threads (`evince`) with the active audio stream (`mpv`). Closing your media viewer window automatically terminates background tasks.
* **Clipboard Automation**: Invoking `--url` without an argument scans your system clipboard to capture remote document endpoints safely.
* **Flexible Suffix Routing**: Built-in wildcard support dynamically triggers tailored app behaviors based on extension type.

---

## Installation

### Prerequisites
The utility automatically checks for missing components on launch and prompts to install them via `apt`. To install dependencies manually:

```bash
sudo apt-get update && sudo apt-get install poppler-utils wget mpv evince pv python3 pipx
```

### Script Deployment
1. Clone this repository or copy the code components into a file named `pdftompv`:
   ```bash
   git clone https://github.com
   cd pdftompv
   ```
2. Make the script executable:
   ```bash
   chmod +x pdftompv
   ```
3. Move it to your local environment binary execution directory:
   ```bash
   sudo mv pdftompv /usr/local/bin/
   ```

---

## Command Interface Layout

```text
Usage: pdftompv [OPTION]... [URL | TARGET]

Options:
  -p, --pdf              Convert input PDF document to an MP3 file
  -o, --open             Launch files according to suffix parameters
  -v, --voice [ALIAS]    Select neural voice profile by short alias
                         (Outputs a voice mapping list if alias is missing or 'list')
                         (Runs an audition preview if no file target is specified)
  -u, --url [LINK]       Download a remote PDF before processing
                         (Pulls text links from the clipboard if LINK is omitted)
  -V, --version          Output version information and exit
  -h, --help             Display the help options configuration map
```

---

## Usage Examples

### 1. Compile a Local Audiobook
Extract text profiles and generate a permanent `.mp3` output file:
```bash
pdftompv --pdf manual.pdf
```

### 2. Download and Convert via Clipboard Links
Copy an HTTP link to a PDF from your web browser, then execute:
```bash
pdftompv --pdf --url
```

### 3. Open Targets Selectively Using Smart Suffixes
The `-o` / `--open` loop alters execution behaviors based on how you reference the filename:

* **Open the Text Visual Layout ONLY**:
  ```bash
  pdftompv --open document.pdf
  ```
* **Play the Audiobook Track ONLY**:
  ```bash
  pdftompv --open document.mp3
  ```
* **Simultaneous Audio and Visual Playback**:
  Using a trailing star wildcard launches the viewer and audio player synchronously:
  ```bash
  pdftompv --open document.*
  ```

### 4. Voice Configuration Auditions
Output the catalog mapping sheet for available neural profiles:
```bash
pdftompv --voice list
```
Instantly listen to a voice preview text sample at `+25%` audiobook speed:
```bash
pdftompv --voice guy
```
Compile a new project using a distinct voice profile identity:
```bash
pdftompv --voice ava --pdf book.pdf
```

---

## Available Voice Registry

| Short Alias | Identity Gender | Technical System String Name |
| :--- | :--- | :--- |
| `aria` | Female | `en-US-AriaNeural` *(Default)* |
| `ava` | Female | `en-US-AvaNeural` |
| `emma` | Female | `en-US-EmmaMultilingualNeural` |
| `michelle` | Female | `en-US-MichelleNeural` |
| `andrew` | Male | `en-US-AndrewMultilingualNeural` |
| `brian` | Male | `en-US-BrianMultilingualNeural` |
| `christopher` | Male | `en-US-ChristopherNeural` |
| `guy` | Male | `en-US-GuyNeural` |
| `eric` | Male | `en-US-EricNeural` |
