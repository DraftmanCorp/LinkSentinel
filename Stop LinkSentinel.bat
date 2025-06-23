@echo off
set pidFile=monitor.pid
if exist "%pidFile%" (
    for /f %%p in (%pidFile%) do taskkill /PID %%p /F
    del "%pidFile%"
) else (
    echo File PID non trovato. Lo script potrebbe non essere in esecuzione.
)
exit