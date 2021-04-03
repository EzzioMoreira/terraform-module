## Terraform Module
- Cria instância EC2 AWS.

## Dependências
- terraform >= 0.14
- make
- docker

## Usando modulo
Crie um arquivo **terrafile.tf** na raiz do seu projeto, você pode seguir esse exemplo:
```terraform
provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu
    bucket = "iaasweek-tfstates-terraform"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
  }
}

module "produto" {
  source                  = "https://github.com/EzzioMoreira/terraform-module?ref=v0.1"
  name                    = "produto"
}

output "ip_address" {
  value = module.produto.ip_address
}
```
## Enviroment
- Crie seu arquivo **.env** a partir do exemplo **.env.example**

## Inputs

| **Nome** | **Descrição** | **Tipo** | **Default** | **Requerido** |
|------|-------------|:----:|:-----:|:-----:|
| **name** |  Nome do projeto | string | n/a | sim |
| **hash\_commit** | Hash commit da imagem AMI | string | sim | não |

## Entendendo Makefile
## Makefile
- $$variable O $$ pega variavel de ambiente e $(variable) pega variavel definida no makefile.

## Docker
- docker run --rm # executa e destroi container
- -v $$PWD:/app -v # mapeamento de volume do aplicativo
- $$HOME/.ssh/:/root/.ssh/ # key de acesso ssh 
- -w /app/ # workdir do container
- -e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY -e TF_VAR_APP_VERSION=$(GIT_COMMIT) # variaveis
- --entrypoint "" # para usar o ssh do container é preciso zerar o entrypoint "" 
- hashicorp/terraform:$(TERRAFORM_VERSION) init -upgrade=true # imagem do container:versão e comando