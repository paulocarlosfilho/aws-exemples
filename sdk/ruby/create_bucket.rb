#!/usr/bin/env ruby
require 'aws-sdk-s3'

if ARGV.length != 1
  puts "Uso: #{$PROGRAM_NAME} <nome-do-bucket>"
  exit 1
end

bucket_name = ARGV[0]
s3 = Aws::S3::Client.new(region: 'us-east-1')

begin
  puts "Criando bucket '#{bucket_name}'..."
  s3.create_bucket(bucket: bucket_name)
  s3.wait_until(:bucket_exists, bucket: bucket_name)
  puts "Bucket '#{bucket_name}' criado com sucesso."

rescue Aws::S3::Errors::BucketAlreadyOwnedByYou
  puts "Bucket '#{bucket_name}' já existe e pertence a você."
rescue Aws::S3::Errors::ServiceError => e
  puts "Erro ao criar o bucket: #{e.message}"
end