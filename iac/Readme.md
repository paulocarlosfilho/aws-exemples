# Gerenciamento de S3 com CloudFormation (CRUD)

Este diretório contém exemplos de templates do AWS CloudFormation para gerenciar buckets S3 de forma declarativa.

## Paradigma Declarativo vs. Imperativo

Diferente de scripts que dão ordens diretas (criar, deletar), o CloudFormation descreve o **estado final** desejado.

- **Create/Update**: A criação e a atualização de recursos são feitas com o comando `aws cloudformation deploy`. O CloudFormation compara o estado atual na nuvem com o descrito no seu template e aplica apenas as mudanças necessárias.
- **Delete**: A exclusão é feita de duas formas:
  1. Removendo a definição do recurso do template e rodando `deploy` novamente.
  2. Deletando toda a stack (o conjunto de recursos) com `aws cloudformation delete-stack`.

## Como Usar os Templates

### 1. Criar um Único Bucket (`create-single-bucket.yaml`)

Este template cria um bucket S3. O nome do bucket é passado como um parâmetro.

**Comando para Deploy:**
```bash
aws cloudformation deploy \
  --template-file create-single-bucket.yaml \
  --stack-name "s3-single-bucket-stack" \
  --parameter-overrides BucketName="meu-bucket-unico-12345-abc" \
  --region us-east-1
```

### 2. Criar Múltiplos Buckets (`create-multiple-buckets.yaml`)

Este template cria dois buckets com nomes fixos.

**Comando para Deploy:**
```bash
aws cloudformation deploy \
  --template-file create-multiple-buckets.yaml \
  --stack-name "s3-multiple-buckets-stack" \
  --region us-east-1
```

### 3. "Criar" um Objeto (`upload-object-example.yaml`)

Este template **não cria o objeto diretamente**. Ele provisiona o bucket de destino. O upload do objeto é uma operação de dados, feita após a infraestrutura estar pronta.

**Passo 1: Crie o bucket com CloudFormation**
```bash
aws cloudformation deploy \
  --template-file upload-object-example.yaml \
  --stack-name "s3-object-upload-stack" \
  --parameter-overrides BucketNameForUpload="meu-bucket-para-upload-123" \
  --region us-east-1
```

**Passo 2: Faça o upload do arquivo com a AWS CLI**
```bash
# Crie um arquivo de exemplo
echo "hello world" > sample.txt

# Envie o arquivo para o bucket criado
aws s3 cp sample.txt s3://meu-bucket-para-upload-123/
```

### 4. Deletar os Recursos

Para deletar os recursos criados por qualquer um desses templates, use o comando `delete-stack` com o nome da stack que você usou no deploy.

**Exemplo:**
```bash
aws cloudformation delete-stack --stack-name "s3-single-bucket-stack" --region us-east-1
```