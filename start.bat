@echo off
setlocal
cd /d "%~dp0"

echo ============================================
echo   Speaking Practice Hub - Local Server
echo ============================================
echo.
echo NOTE: Opening SpeakingHub.html directly (file://)
echo will NOT work. Browsers block local folder
echo access on the file:// protocol.
echo.

set "URL=http://127.0.0.1:8000/SpeakingHub.html"

where python >nul 2>nul
if "%ERRORLEVEL%"=="0" goto RUN_PY

where py >nul 2>nul
if "%ERRORLEVEL%"=="0" goto RUN_PY_LAUNCHER

where node >nul 2>nul
if "%ERRORLEVEL%"=="0" goto RUN_NODE

goto RUN_PS

:RUN_PY
echo [OK] Python found. Starting server on port 8000...
echo      Press Ctrl+C in this window to stop.
echo      Open: %URL%
echo.
start "" "%URL%"
python -m http.server 8000 --bind 127.0.0.1
goto DONE

:RUN_PY_LAUNCHER
echo [OK] Python Launcher found. Starting server on port 8000...
echo      Press Ctrl+C in this window to stop.
echo      Open: %URL%
echo.
start "" "%URL%"
py -m http.server 8000 --bind 127.0.0.1
goto DONE

:RUN_NODE
echo [OK] Node.js found. Starting server on port 8000...
echo      Press Ctrl+C in this window to stop.
echo      Open: %URL%
echo.
start "" "%URL%"
npx --yes serve -l 8000
goto DONE

:RUN_PS
echo [OK] No Python/Node found - using built-in PowerShell server.
echo      (Windows built-in, no extra install needed)
echo      Press Ctrl+C in this window to stop.
echo      Open: %URL%
echo.
start "" "%URL%"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0server.ps1" -Port 8000
goto DONE

:DONE
echo.
echo Server stopped.
pause
