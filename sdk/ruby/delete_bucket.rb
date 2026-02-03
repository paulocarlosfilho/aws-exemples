#!/usr/bin/env ruby
require 'aws-sdk-s3'

if ARGV.length != 1
  puts "Uso: #{$PROGRAM_NAME} <nome-do-bucket>"
  exit 1
end

bucket_name = ARGV[0]
s3 = Aws::S3::Client.new(region: 'us-east-1')

begin
  puts "Deletando bucket '#{bucket_name}'..."
  s3.delete_bucket(bucket: bucket_name)
  s3.wait_until(:bucket_not_exists, bucket: bucket_name)
  puts "Bucket deletado com sucesso."

rescue Aws::S3::Errors::NoSuchBucket
  puts "Erro: O bucket '#{bucket_name}' não foi encontrado."
rescue Aws::S3::Errors::BucketNotEmpty
  puts "Erro: O bucket '#{bucket_name}' não está vazio. Delete todos os objetos antes."
rescue Aws::S3::Errors::ServiceError => e
  puts "Erro ao deletar o bucket: #{e.message}"
end