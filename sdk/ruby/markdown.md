# Scripts Ruby para AWS S3

Este diretório contém um conjunto de scripts Ruby para realizar operações CRUD (Create, Read, Update, Delete) no Amazon S3.

## Configuração

### 1. Pré-requisitos
- **Ruby**: Certifique-se de que o Ruby está instalado.
- **Bundler**: Instale o Bundler para gerenciar as dependências: `gem install bundler`.
- **Credenciais AWS**: Configure suas credenciais da AWS. A forma mais comum é através do comando `aws configure` da AWS CLI. Os scripts usarão essas credenciais automaticamente.

### 2. Instalar Dependências
Navegue até este diretório (`sdk/ruby/`) e execute o Bundler para instalar as gemas listadas no `Gemfile` (como `aws-sdk-s3`):
```bash
bundle install
```

## Como Usar os Scripts

Execute os scripts a partir do seu terminal. Abaixo estão os exemplos de uso para cada um.

- **Listar Buckets**
  ```bash
  ruby list_buckets.rb
  ```

- **Criar um Bucket**
  ```bash
  # Uso: ruby create_bucket.rb <nome-do-bucket>
  ruby create_bucket.rb meu-bucket-de-teste-12345
  ```

- **Listar Objetos em um Bucket**
  ```bash
  # Uso: ruby list_objects.rb <nome-do-bucket>
  ruby list_objects.rb meu-bucket-de-teste-12345
  ```

- **Fazer Upload de um Objeto**
  ```bash
  # Uso: ruby put_object.rb <nome-do-bucket> <caminho-do-arquivo-local> <nome-do-objeto-no-s3>
  ruby put_object.rb meu-bucket-de-teste-12345 ../../files-aws-put-5/1.txt meu-arquivo-1.txt
  ```

- **Deletar um Objeto**
  ```bash
  # Uso: ruby delete_object.rb <nome-do-bucket> <nome-do-objeto-no-s3>
  ruby delete_object.rb meu-bucket-de-teste-12345 meu-arquivo-1.txt
  ```

- **Deletar um Bucket**
  *Atenção: O bucket deve estar vazio para ser deletado.*
  ```bash
  # Uso: ruby delete_bucket.rb <nome-do-bucket>
  ruby delete_bucket.rb meu-bucket-de-teste-12345
  ```