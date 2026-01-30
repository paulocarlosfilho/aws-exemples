# Create Bucket
Import-Module AWS.Tools.S3

$region = "us-west-1"

$bucketName = Read-Host Prompt "Enter the S3 bucket name"

write-Host "AWS region: $region"

write-Host "S3 Bucket Name: $bucketName"

New-S3Bucket -BucketName $bucketName -Region $region
