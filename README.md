# Recap Studio

Local studio for making recap videos: collect footage, write the script with Claude, generate the voice-over, and render.

## Voice engines (all optional, installed from `SETUP.bat`)

| Engine | Runs | Cloning | Notes |
|---|---|---|---|
| Edge-TTS | online, free | no | many voices |
| Kokoro | offline, any CPU | no | ~350 MB |
| Pocket TTS | offline, any CPU | yes | English, 8 built-in voices |
| Chatterbox | offline | yes | Nano 110M / Turbo 350M / Original 500M / Multilingual 500M, `[laugh]` tags |
| ElevenLabs / MiniMax | online, paid | - | add your key in the app |

## Install (Windows)

1. Double-click `SETUP.bat`. It installs the base tools, then asks which voice engines and models to download.
2. Copy `keys.env.example` to `keys.env` if you use ElevenLabs or MiniMax (or paste keys in the app's API keys screen).
3. Double-click `START_UI.bat`.

Run `SETUP.bat` again at any time to add engines. Chatterbox needs Python 3.11 or 3.10; Nano is installed from the GitHub `master` branch because the PyPI release does not include it yet.

## Notes

- Chatterbox output carries Resemble AI's Perth watermark.
- Only clone voices you have the right to use. Reference clips go in `voices/` (git-ignored).
- Models and engines live in `models/` and `venvs/` (git-ignored); do not move the folder after running setup.
- Each engine and model has its own license; check them before redistributing audio or models.
