@echo off
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0install-windows.ps1"
if errorlevel 1 (
 echo Installation did not finish. Ask Codex for help with this message.
 pause
 exit /b 1
)
echo Installation completed. Open a new Codex chat.
pause
