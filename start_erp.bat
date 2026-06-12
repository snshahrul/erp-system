@echo off
title AD Deen ERP - Starting...
echo Starting ERP System...

:: Start ERP Server (hidden)
start /MIN "ERP Server" cmd /c "cd /d c:\Users\shahr\Documents\GitHub\erp system && python server.py"

:: Wait 3 seconds
ping -n 4 127.0.0.1 >nul

:: Start Cloudflare Tunnel (hidden)
start /MIN "Tunnel" cmd /c "cloudflared tunnel run erp-tunnel"

echo.
echo ERP is starting...
echo Office: http://192.168.1.xxx:8080/ADDeen_ERP.html
echo Remote: https://erp.sn-shahrul.com/ADDeen_ERP.html
echo.
echo You can close this window.
ping -n 3 127.0.0.1 >nul