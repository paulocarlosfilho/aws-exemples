#!/usr/bin/env bash

# Utilitário para converter JSON da AWS para formato TOON (Otimizado para Gemini)
# Uso: aws s3api list-objects --bucket meu-bucket | ./aws_to_toon.sh

if [ -t 0 ]; then
    echo "Erro: Este script precisa receber um JSON via pipe (|)."
    echo "Exemplo: aws s3api list-objects --bucket meu-bucket | ./aws_to_toon.sh"
    exit 1
fi

# Usa o python (que já vem no sistema/WSL) para formatar o TOON de forma simples
python3 -c "
import sys, json

try:
    data = json.load(sys.stdin)
    if 'Contents' in data:
        items = data['Contents']
        print(f'S3Objects[{len(items)}]{{Key,Size,LastModified}}:')
        for item in items:
            print(f'  {item[\"Key\"]},{item[\"Size\"]},{item[\"LastModified\"]}')
    elif 'Buckets' in data:
        items = data['Buckets']
        print(f'Buckets[{len(items)}]{{Name,CreationDate}}:')
        for item in items:
            print(f'  {item[\"Name\"]},{item[\"CreationDate\"]}')
    else:
        # Formato genérico se não for S3
        print('Data[unknown]:')
        print(json.dumps(data, indent=2))
except Exception as e:
    print(f'Erro na conversão: {e}')
"
