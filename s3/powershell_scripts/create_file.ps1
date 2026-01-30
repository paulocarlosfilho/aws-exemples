# Create File in S3 Bucket
Import-Module AWS.Tools.S3

$bucketName = Read-Host Prompt "Enter the S3 bucket name"
$filePath = Read-Host Prompt "Enter the local file path to upload"
$keyName = Read-Host Prompt "Enter the S3 object key name (file name in S3)"
write-Host "S3 Bucket Name: $bucketName"
write-Host "Local File Path: $filePath"
write-Host "S3 Object Key Name: $keyName"
Set-DefaultAWSRegion -Region "us-west-1"

Write-S3Object -BucketName $bucketName -File $filePath -Key $keyName -Region "us-west-1"
