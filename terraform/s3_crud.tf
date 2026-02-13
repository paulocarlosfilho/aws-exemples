# Criar 3 buckets com nomes únicos
resource "aws_s3_bucket" "meus_buckets-estudo" {
  count         = 3
  bucket        = "paulo-estudo-s3-${count.index}-2026"
  force_destroy = true # Deleta tudo no 'terraform destroy'

  tags = {
    Name    = "paulo-estudo-bucket-${count.index}"
    Project = "Estudo AWS com Terraform"
  }
}

# Criar um objeto no primeiro bucket
resource "aws_s3_object" "arquivo_teste" {
  bucket  = aws_s3_bucket.meus_buckets-estudo[0].id
  key     = "config/ola-mundo.txt"
  content = "Testando o CRUD de S3 do Paulo no Terraform!"
}

# Endpoint de Gateway para S3 (O "buraco na parede" gratuito)
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.us-east-1.s3"
}