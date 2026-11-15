@echo off
rem KOTOR Academy: checks what the game needs, then starts it.
setlocal
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0play.ps1" %*
if errorlevel 1 pause
exit /b %errorlevel%
