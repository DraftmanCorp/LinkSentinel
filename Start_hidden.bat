@echo off
powershell -Command ^
  "Start-Process -WindowStyle Hidden -FilePath 'powershell.exe' -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"Script.ps1\"' -PassThru | ForEach-Object { $_.Id } | Out-File -Encoding ASCII 'monitor.pid'"
exit