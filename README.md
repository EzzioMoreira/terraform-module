# This Terraform deploy AWS EC2.

This Terraform:
* Create VPC.
* Create Sub-net.
* Create Internet Gateway.
* Configure rule of securety group.
* Create EC2

### Prerequisites on your machine

* Docker
* Make
* Credential for AWS

### Usage
First set up a few variables for your environment in file "variables.tf".

| Name | Description | Type | Default |
|------|-------------|:----:|:-----:|
| aws\_regionp | Region to AWS. | string | `"us-east-2"` |
| app\_name | The name of product. | string | `"DevOps"` |
| ami\_name | The name of AWS AMI. | string | `"ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64*"` |
| owners\_ami | The owner of the AMI "canonical". | string | `"099720109477"` |
| count\_instance | CThe number of instance. | string | `"1"` |
| instance\_type | The instance type. | string | `"t3a.small"` |
| default\_tags | Default tags name. | map | `"Key: value"` |

For help, run the following commands:
- make help
```make
terraform-init: ## Run terraform init to download all necessary plugins
terraform-plan: ## Exec a terraform plan and puts it on a file called plano
terraform-apply: ## Uses plano to apply the changes on AWS.
terraform-destroy: ## Destroy all resources created by the terraform file in this repo.
```