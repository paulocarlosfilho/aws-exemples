sudo apt update
sudo apt install -y nodejs npm

# Iniciando
npm install -g aws-cdk
mkdir meu-projeto-cdk && cd meu-projeto-cdk
cdk init app --language typescript