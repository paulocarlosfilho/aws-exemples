# Projeto Java para AWS S3 com Maven

Este documento fornece as instruções para configurar e executar um projeto Java que interage com o Amazon S3 usando o AWS SDK for Java 2.x e o Maven.

## Pré-requisitos

- **Java Development Kit (JDK)**: Versão 11 ou superior.
- **Apache Maven**: Para gerenciamento de dependências e compilação do projeto.
- **AWS CLI**: Instalada e configurada com suas credenciais (`aws configure`).

## Configuração do Projeto

### 1. Criar o Projeto Maven (se ainda não tiver um)
Você pode usar o comando abaixo para gerar a estrutura básica de um projeto Maven:
```bash
mvn archetype:generate \
  -DgroupId=com.mycompany.app \
  -DartifactId=my-app \
  -DarchetypeArtifactId=maven-archetype-quickstart \
  -DinteractiveMode=false
```

### 2. Adicionar Dependências da AWS no `pom.xml`
Para usar o SDK da AWS, adicione as seguintes dependências ao seu arquivo `pom.xml`, dentro da seção `<dependencies>`:

```xml
<!-- Bloco de gerenciamento de dependências da AWS -->
<dependencyManagement>
  <dependencies>
    <dependency>
      <groupId>software.amazon.awssdk</groupId>
      <artifactId>bom</artifactId>
      <version>2.20.26</version>
      <type>pom</type>
      <scope>import</scope>
    </dependency>
  </dependencies>
</dependencyManagement>

<!-- Dependência específica para o S3 -->
<dependencies>
  <dependency>
    <groupId>software.amazon.awssdk</groupId>
    <artifactId>s3</artifactId>
  </dependency>
</dependencies>
```
**Nota:** O `bom` (Bill of Materials) garante que todas as dependências do AWS SDK que você usar serão de versões compatíveis entre si.

## Como Compilar e Executar

### 1. Compilar o Projeto
Navegue até o diretório raiz do seu projeto (onde está o `pom.xml`) и execute:
```bash
mvn clean package
```
Isso irá compilar o código e empacotá-lo em um arquivo JAR.

### 2. Executar uma Classe
Para executar uma classe específica que realiza uma operação no S3 (por exemplo, `ListBuckets.java`), use o seguinte comando, substituindo `com.mycompany.app.ListBuckets` pelo nome completo da sua classe:

```bash
# Exemplo para listar buckets
mvn exec:java -Dexec.mainClass="com.mycompany.app.ListBuckets"
```

Se a sua classe principal espera argumentos (como o nome de um bucket), você pode passá-los da seguinte forma:
```bash
# Exemplo para criar um bucket
mvn exec:java -Dexec.mainClass="com.mycompany.app.CreateBucket" -Dexec.args="meu-novo-bucket-123"
```