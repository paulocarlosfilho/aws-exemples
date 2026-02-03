#!/usr/bin/env ruby
require 'aws-sdk-s3'

if ARGV.length != 1
  puts "Uso: #{$PROGRAM_NAME} <nome-do-bucket>"
  exit 1
end

bucket_name = ARGV[0]
s3 = Aws::S3::Client.new(region: 'us-east-1')

begin
  puts "Listando objetos no bucket '#{bucket_name}':"
  response = s3.list_objects_v2(bucket: bucket_name)

  if response.contents.empty?
    puts "Nenhum objeto encontrado."
  else
    response.contents.each do |object|
      puts "- #{object.key} (#{object.size} bytes)"
    end
  end

rescue Aws::S3::Errors::NoSuchBucket
  puts "Erro: O bucket '#{bucket_name}' não foi encontrado."
rescue Aws::S3::Errors::ServiceError => e
  puts "Erro ao listar objetos: #{e.message}"
end