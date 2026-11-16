@echo off
rem KOTOR Academy: checks what the game needs, then starts it.
start "" powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0play.ps1" %*
