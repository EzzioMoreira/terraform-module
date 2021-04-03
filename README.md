# Curso Infra-as-Code Linux Tips
- Aula terraform Meta-Argument for_each. for no instance_type e for output com for in para instance.tag + ip address.
- docker run -it -v $PWD:/app -w /app --entrypoint "" hashicorp/terraform:light sh

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

## Comandos básicos
- terraform init -upgrade # verifica cód., sintaxe dos arquivos. 
- terraform plan -out plano # cria infra e garda em arquivo. 
- terraform apply "plano" # aplica terraform na aws.