# aws-exemples

Exemplos e scripts para trabalhar com **AWS CLI** e **Amazon S3**. Material de estudo e referência rápida para operações com buckets e objetos.

## Pré-requisitos

- **AWS CLI** configurado (`aws configure`)
- Credenciais válidas (Access Key, Secret Key)
- Para scripts PowerShell: módulo `AWS.Tools.S3`

## Estrutura do Projeto

```
aws-exemples/
├── Manual.md              # Guia de comandos e dicas AWS
├── aws-cli.yaml           # Setup para ambiente Theia/Cloud
├── files-aws-put-5/       # Arquivos de teste para upload
└── s3/
    ├── bash_scripts/      # Scripts para Linux/Git Bash/WSL
    └── powershell_scripts/ # Scripts para Windows PowerShell
```

## Scripts Bash (`s3/bash_scripts/`)

| Script | Descrição | Uso |
|--------|-----------|-----|
| `create_bucket` | Cria um novo bucket S3 | `./create_bucket meu-bucket-unico` |
| `delete_bucket` | Remove um bucket vazio | `./delete_bucket nome-do-bucket` |
| `put_bucket` | Gera arquivos de teste para upload | `./put_bucket 10` (quantidade opcional) |
| `put_objects` | Faz upload de objetos para o bucket | - |
| `list_buckets` | Lista buckets | - |
| `list_objects` | Lista objetos de um bucket | - |
| `delete_object` | Remove um objeto | - |
| `delete_objects` | Remove múltiplos objetos | - |
| `sync` | Sincroniza pasta local com bucket | `./sync nome-do-bucket prefixo` |

**Executar:** `chmod +x script` e depois `./script`

## Scripts PowerShell (`s3/powershell_scripts/`)

| Script | Descrição |
|--------|-----------|
| `create_bucket.ps1` | Cria um bucket S3 (região us-west-1) |
| `create_buckets.ps1` | Cria múltiplos buckets e pastas |
| `create_file.ps1` | Upload de arquivo para S3 |
| `delete_file.ps1` | Remove arquivo do bucket |

**Executar:** `pwsh -File create_bucket.ps1` ou no PowerShell: `.\create_bucket.ps1`

## Início Rápido

### Bash (Linux/WSL/Git Bash)

```bash
cd s3/bash_scripts
./create_bucket meu-bucket-teste
./put_bucket 5
./sync meu-bucket-teste arquivo
```

### PowerShell (Windows)

```powershell
cd s3\powershell_scripts
.\create_bucket.ps1
# Siga os prompts para nome do bucket
```

## Documentação

- **[Manual.md](Manual.md)** – Comandos AWS CLI, S3, IAM, autenticação e instruções para Linux/Windows

## Segurança

- Não commite credenciais ou arquivos `.env`
- O `.gitignore` já exclui `.aws/` e `*aws_senhas*`
