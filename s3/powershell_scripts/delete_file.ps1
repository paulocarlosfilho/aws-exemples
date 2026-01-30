$bucketName = Read-Host "Enter the S3 bucket name"
$keyName = Read-Host "Enter the S3 object key (file name)"
$region = "us-west-1" # Use a mesma região onde o bucket foi criado

Write-Host "Excluindo arquivo $keyName do bucket $bucketName..." -ForegroundColor Yellow

# O parâmetro -Force evita que ele peça confirmação para cada arquivo
Remove-S3Object -BucketName $bucketName -Key $keyName -Region $region -Force

Write-Host "Concluído!" -ForegroundColor Green