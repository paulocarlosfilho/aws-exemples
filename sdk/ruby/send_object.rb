#!/usr/bin/env ruby
require 'aws-sdk-s3'

if ARGV.length != 3
  puts "Uso: #{$PROGRAM_NAME} <nome-do-bucket> <caminho-do-arquivo> <nome-do-objeto-no-s3>"
  exit 1
end

bucket_name = ARGV[0]
file_path = ARGV[1]
object_key = ARGV[2]

unless File.exist?(file_path)
  puts "Erro: O arquivo '#{file_path}' não foi encontrado."
  exit 1
end

s3 = Aws::S3::Resource.new(region: 'us-east-1')
bucket = s3.bucket(bucket_name)

begin
  puts "Enviando '#{file_path}' para '#{bucket_name}/#{object_key}'..."
  
  obj = bucket.object(object_key)
  obj.upload_file(file_path)

  puts "Arquivo enviado com sucesso!"

rescue Aws::S3::Errors::NoSuchBucket
  puts "Erro: O bucket '#{bucket_name}' não foi encontrado."
rescue Aws::S3::Errors::ServiceError => e
  puts "Erro ao enviar o arquivo: #{e.message}"
end