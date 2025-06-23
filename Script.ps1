# LinkSentinel 1.0 - Monitoraggio connessione internet
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$logFile = Join-Path $scriptPath ("Log_monitor_" + (Get-Date -Format "yyyy-MM-dd") + ".txt")

$welcome = @"
=============================================
  LinkSentinel Pro.| INTERNET UPLINK LOGGER
  Version: v0.0.1

  Script By: DraftmanCorp
  Avvio: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
=============================================


"@

$welcome | Out-File -FilePath $logFile -Encoding UTF8 -Append
Write-Host $welcome

# Controlla la policy di esecuzione e la imposta se necessario
$currentPolicy = Get-ExecutionPolicy
if ($currentPolicy -eq 'Restricted' -or $currentPolicy -eq 'Undefined') {
    Write-Host "Impostazione della policy di esecuzione a RemoteSigned (richiede permessi amministrativi)..."
    try {
        Set-ExecutionPolicy RemoteSigned -Scope Process -Force
        Write-Host "Policy di esecuzione impostata a RemoteSigned per questa sessione."
    }
    catch {
        Write-Host "Impossibile cambiare la policy di esecuzione. Esegui PowerShell come amministratore e riprova."
        exit
    }
}

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$logFile = Join-Path $scriptPath ("Log_Connessione_" + (Get-Date -Format "yyyy-MM-dd") + ".txt")

$targets = @(
    @{ Name = "Google";     Url = "https://www.google.com" },
    @{ Name = "Microsoft";  Url = "https://www.microsoft.com" },
    @{ Name = "Cloudflare"; Url = "https://www.cloudflare.com" }
)

# Calcola la larghezza massima per Nome e URL
$maxNameLength = ($targets | ForEach-Object { $_.Name.Length } | Measure-Object -Maximum).Maximum
$maxUrlLength  = ($targets | ForEach-Object { $_.Url.Length }  | Measure-Object -Maximum).Maximum

while ($true) {
    # Aggiorna il nome del file log ogni ciclo per gestire il cambio giorno
    $logFile = Join-Path $scriptPath ("Log_Connessione_" + (Get-Date -Format "yyyy-MM-dd") + ".txt")

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    foreach ($target in $targets) {
        try {
            $response = Invoke-WebRequest -Uri $target.Url -Method Head -TimeoutSec 5 -ErrorAction Stop
            $status = if ($response.StatusCode -eq 200) { "UPLINK OK" } else { "CONNECTION FAILED" }
        }
        catch {
            $status = "CONNECTION FAILED"
        }

        # Allinea nome, URL e status
        $name = $target.Name.PadRight($maxNameLength)
        $url  = $target.Url.PadRight($maxUrlLength)
        $statusStr = $status.PadRight(6)

        $line = "$timestamp - $name [$url] - $statusStr"

        $line | Out-File -FilePath $logFile -Append -Encoding UTF8
        Write-Host $line
    }

    # Separatore con un trattino
    "-" | Out-File -FilePath $logFile -Append -Encoding UTF8
    Write-Host "-"

    Start-Sleep -Seconds 10
}