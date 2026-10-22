# Recap Studio v2

A local-first pipeline for turning films, shows, games, and topics into narrated
recap / mini-documentary videos, with a browser UI that drives the whole workflow.

Each video type is a self-contained project: its own script, `config.json`,
`project.json`, and `segments.json`.

## Video types

`movie_recap` · `show_recap` · `nba_minidoc` · `nba_story` · `real_story` · `ranking`

Recaps can end as a finished `.mp4` **or** a Premiere XML. Everything else produces
a rough cut for Premiere.

## Quick start

1. **One-time setup** — double-click `SETUP.bat`
   (installs `requests`, `edge-tts`, `yt-dlp` and checks for FFmpeg).
2. **Start the UI** — double-click `START_UI.bat`
   It opens a browser tab for projects, run steps with live logs, script editing,
   drag-and-drop footage collection, voice settings and output previews.
3. **Create a project** — double-click `NEW_PROJECT.bat` (or drag a film onto it),
   then run `MENU.bat` inside the new project folder.

The legacy terminal flow (`MENU.bat`) still works if you prefer it.

See `START_HERE.txt` for the short version and `_template/README.txt` for the full
reference of folders, segment fields, Premiere output and the collect step.

## Layout

```
studio.py            the local web server + UI backend
web/                 UI front-end (index.html, app.js, style.css, guide.html)
_template/           the template copied into every new project
  recap.py           the build engine (voice, footage, Premiere XML, video)
  config.json        per-project settings (voice engine, fill mode, ...)
  PASTE_THIS_TO_CLAUDE*.txt   prompts for the Claude step
Projects/            your actual projects live here
keys.env             API keys — gitignored, never commit
```

## API keys

Keys live in `keys.env` (gitignored) or in the UI under **API keys**.
Edge-TTS needs no key. ElevenLabs and MiniMax keys are optional.

## Requirements

- Python 3.12+ (`SETUP.bat` can install it with winget)
- FFmpeg / FFprobe (also auto-installable via `SETUP.bat`)

## Notes

- `STATE.md` is rewritten after every step — paste it into a new Claude chat to resume.
- Downloading clips may breach some sites' terms; heavy use of copyrighted footage
  with thin commentary can trigger content claims.
