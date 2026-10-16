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

goto NO_RUNTIME

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

:NO_RUNTIME
echo [ERROR] Neither Python nor Node.js was found on PATH.
echo.
echo Please install one of them, then run this script again:
echo   Python : https://www.python.org/downloads/
echo   Node.js: https://nodejs.org/
echo.
pause
exit /b 1

:DONE
echo.
echo Server stopped.
pause
