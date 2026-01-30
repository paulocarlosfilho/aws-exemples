# Manual AWS - Dicas e Comandos

Este guia serve como referência rápida para os comandos e configurações da AWS CLI utilizados durante o curso.

## Configurações Úteis

### Auto-prompt
O Auto-prompt ajuda a completar os comandos da AWS CLI, mostrando as opções disponíveis enquanto você digita.
```bash
# Para ativar o Auto-prompt parcialmente (recomendado)
export AWS_CLI_AUTO_PROMPT=on-partial
```

---

## S3 (Simple Storage Service)

### Comandos de Bucket
```bash
# Criar um novo bucket (mb = make bucket)
aws s3 mb s3://nome-do-seu-bucket-unico

# Listar todos os seus buckets
aws s3 ls

# Listar buckets usando s3api (retorno em JSON detalhado)
aws s3api list-buckets

# Nota: O S3 pode ser usado no powershell, muito mais facil pois ele usa os objetos ao invés de texto.

# Remover um bucket vazio (rb = remove bucket)
aws s3 rb s3://nome-do-seu-bucket-unico
```

### Comandos de Objetos (Arquivos)
```bash
# Enviar um arquivo para o bucket
aws s3 cp arquivo.txt s3://nome-do-seu-bucket-unico/

# Listar o conteúdo de um bucket
aws s3 ls s3://nome-do-seu-bucket-unico/

# Baixar um arquivo do bucket
aws s3 cp s3://nome-do-seu-bucket-unico/arquivo.txt .

# Remover todos os arquivos de uma pasta (recursivo)
aws s3 rm s3://nome-do-seu-bucket-unico/nome-da-pasta --recursive
```

---

# Usando o powershell

1. Dependências e PowerShell
```
apk update
apk add --no-cache \
    ca-certificates less ncurses-terminfo-base krb5-libs libgcc \
    libintl libssl3 libstdc++ tzdata userspace-rcu zlib icu-libs \
    curl unzip bash gcompat

apk add --no-cache powershell --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
```

2. AWS CLI v2
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install
rm -rf awscliv2.zip aws/
```
3. AWS Tools + Módulo S3 (Já deixa o CRUD pronto)
```
pwsh -Command "
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted;
    Install-Module -Name AWS.Tools.Installer -Force -Scope CurrentUser;
    Install-AWSToolsModule S3 -Force -Scope CurrentUser
"
```
---

## IAM & Autenticação

### Identidade atual
```bash
# Verificar quem é o usuário logado e a conta
aws sts get-caller-identity
```

### Configuração Inicial
```bash
# Configurar chaves de acesso e região
aws configure
```

---

## Segurança (ACLs e Grupos)
- **ACL (Access Control List)**: Lista básica de permissões para recursos (antigo).
- **Security Groups**: Firewall para suas instâncias (EC2).
- **Network ACL (NACL)**: Firewall para suas sub-redes (VPC).
