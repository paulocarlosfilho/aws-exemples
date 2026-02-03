#!/usr/bin/env ruby
require 'aws-sdk-s3'

# Configura o cliente S3.
# Ele usará as credenciais do seu ambiente (ex: de `aws configure`).
# A região 'us-east-1' é um padrão, mas você pode alterá-la.
s3 = Aws::S3::Client.new(region: 'us-east-1')

begin
  puts "Listando buckets:"
  response = s3.list_buckets

  if response.buckets.empty?
    puts "Nenhum bucket encontrado."
  else
    response.buckets.each do |bucket|
      puts "- #{bucket.name}"
    end
  end

rescue Aws::S3::Errors::ServiceError => e
  puts "Erro ao listar buckets: #{e.message}"
end