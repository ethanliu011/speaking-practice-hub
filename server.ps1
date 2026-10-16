param([int]$Port = 8000)

$ErrorActionPreference = 'Stop'
$root = (Get-Location).Path

$mimeTypes = @{
    '.html'  = 'text/html; charset=utf-8'
    '.htm'   = 'text/html; charset=utf-8'
    '.json'  = 'application/json; charset=utf-8'
    '.js'    = 'application/javascript; charset=utf-8'
    '.css'   = 'text/css; charset=utf-8'
    '.svg'   = 'image/svg+xml'
    '.png'   = 'image/png'
    '.jpg'   = 'image/jpeg'
    '.jpeg'  = 'image/jpeg'
    '.gif'   = 'image/gif'
    '.ico'   = 'image/x-icon'
    '.txt'   = 'text/plain; charset=utf-8'
    '.md'    = 'text/markdown; charset=utf-8'
    '.woff'  = 'font/woff'
    '.woff2' = 'font/woff2'
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://127.0.0.1:$Port/")

try {
    $listener.Start()
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "  Speaking Practice Hub - Local Server" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host ("Serving : " + $root) -ForegroundColor DarkGray
    Write-Host ("URL     : http://127.0.0.1:$Port/SpeakingHub.html") -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Press Ctrl+C to stop the server." -ForegroundColor Yellow
    Write-Host ""

    while ($listener.IsListening) {
        $context  = $listener.GetContext()
        $request  = $context.Request
        $response = $context.Response

        $relPath = [Uri]::UnescapeDataString($request.Url.LocalPath).TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($relPath)) { $relPath = 'SpeakingHub.html' }

        $fullPath = [System.IO.Path]::GetFullPath((Join-Path $root $relPath))

        # 防目录穿越：解析后必须仍在 root 之内
        if (-not $fullPath.StartsWith($root, [StringComparison]::OrdinalIgnoreCase)) {
            $response.StatusCode = 403
            $response.Close()
            continue
        }

        if (-not (Test-Path $fullPath -PathType Leaf)) {
            Write-Host ("  [404] " + $relPath) -ForegroundColor Yellow
            $response.StatusCode = 404
            $response.Close()
            continue
        }

        $ext = [System.IO.Path]::GetExtension($fullPath).ToLowerInvariant()
        if ($mimeTypes.ContainsKey($ext)) {
            $response.ContentType = $mimeTypes[$ext]
        } else {
            $response.ContentType = 'application/octet-stream'
        }

        try {
            $bytes = [System.IO.File]::ReadAllBytes($fullPath)
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
            Write-Host ("  [200] " + $relPath) -ForegroundColor DarkGray
        } catch {
            Write-Host ("  [500] " + $relPath) -ForegroundColor Red
            $response.StatusCode = 500
        }
        $response.Close()
    }
} catch {
    Write-Host ""
    Write-Host "[ERROR] Cannot start server on port $Port." -ForegroundColor Red
    Write-Host "        The port may already be in use by another program." -ForegroundColor Yellow
    exit 1
} finally {
    if ($listener) {
        if ($listener.IsListening) { $listener.Stop() }
        $listener.Close()
    }
}
