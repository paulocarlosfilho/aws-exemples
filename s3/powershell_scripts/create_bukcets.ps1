
Import-Module AWS.Tools.S3


# Create Folders
$pastas = @("fotos", "documentos", "backups", "videos")
$bucketName = "seu-bucket-aqui"
foreach ($pasta in $pastas) {
    Write-Host "Criando pasta: $pasta..."
    # No S3, criamos uma 'pasta' subindo um objeto vazio com barra no final
    Write-S3Object -BucketName $bucketName -Key "$pasta/" -Content ""
}

# Create Buckets
$buckets = @("bucket-projeto-a", "bucket-projeto-b", "bucket-projeto-c")
foreach ($nome in $buckets) {
    Write-Host "Provisionando bucket: $nome"
    New-S3Bucket -BucketName $nome -Region "us-east-1"
}
