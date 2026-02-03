#!/usr/bin/env ruby
require 'aws-sdk-s3'

if ARGV.length != 2
  puts "Uso: #{$PROGRAM_NAME} <nome-do-bucket> <nome-do-objeto-no-s3>"
  exit 1
end

bucket_name = ARGV[0]
object_key = ARGV[1]

s3 = Aws::S3::Client.new(region: 'us-east-1')

begin
  puts "Deletando objeto '#{object_key}' do bucket '#{bucket_name}'..."
  s3.delete_object(bucket: bucket_name, key: object_key)
  puts "Objeto deletado com sucesso."

rescue Aws::S3::Errors::NoSuchBucket
  puts "Erro: O bucket '#{bucket_name}' não foi encontrado."
rescue Aws::S3::Errors::ServiceError => e
  puts "Erro ao deletar o objeto: #{e.message}"
end