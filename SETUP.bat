@echo off
cd /d "%~dp0"
title Recap Studio - Setup
echo.
echo  RECAP STUDIO SETUP
echo  Everything is installed from here: base tools first, then YOU choose which voice engines
echo  and models to download. Run this file again any time to add more.
echo.

echo [1/3] Checking Python...
set "PY="
where py >nul 2>nul && set "PY=py -3"
if not defined PY where python >nul 2>nul && set "PY=python"
if not defined PY goto nopython
%PY% --version

echo.
echo [2/3] Installing base packages (requests, yt-dlp, pillow, numpy, pymupdf)...
%PY% -m pip install --upgrade requests yt-dlp pillow numpy pymupdf
if errorlevel 1 goto pipfail

echo.
echo [3/3] Checking FFmpeg...
where ffmpeg >nul 2>nul
if errorlevel 1 goto noffmpeg
where ffprobe >nul 2>nul
if errorlevel 1 goto noffmpeg
echo FFmpeg OK.

echo.
%PY% setup_engines.py
echo.
echo ===== Setup finished. Double-click NEW_PROJECT.bat to start. =====
goto end

:nopython
echo Python not found - installing with winget...
winget install -e --id Python.Python.3.12
echo.
echo Close this window and run SETUP.bat again once the install finishes.
goto end

:pipfail
echo [!] pip failed. Check your internet connection and try again.
goto end

:noffmpeg
echo FFmpeg not found - installing with winget...
winget install -e --id Gyan.FFmpeg
echo.
echo Close this window and run SETUP.bat again so FFmpeg is on PATH.

:end
echo.
pause
