# List S3 Buckets
Import-Module AWS.Tools.S3

Write-Host "== Lista de Buckets S3 ==" -ForegroundColor Cyan
Write-Host ""

$buckets = Get-S3Bucket

if ($buckets.Count -eq 0) {
    Write-Host "Nenhum bucket encontrado." -ForegroundColor Yellow
    exit 0
}

$buckets | Sort-Object CreationDate -Descending | Format-Table -Property BucketName, CreationDate -AutoSize
