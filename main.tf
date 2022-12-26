terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {                                    # Qual é o cloud provider, pode ser GCP ou Azure ou AWS. Não oficiais são mantidos pela comunidade
  region  = "sa-east-1"                             # Qual é a região que a instância vai ser provisionada
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b22b708611ed2690"           # Nome da imagem. Esta é a imagem para Ubuntu 22.04
  instance_type = "t2.micro"                        # Tipo da instância, o t2.micro é tier free
  key_name      = "aws-marcelo"                     # Associa um par de chaves ssh a instancia. Esse par tem que estar criado lá na AWS. Não precisa do formato .pem. Precisa estar na mesma pasta =/ 
                                                    # User_data é para por os comandos shell
  #user_data     = <<-EOF
  #                  #!/bin/bash
  #                  cd /home/ubuntu/
  #                  hostnamectl set-hostname UBUNTAO
  #                  echo "Feito com o Terraform Tranformers" > index.html
  #                  nohup busybox httpd -f -p 8081
  #                  EOF
  tags = {
    Name = "alura-aws-ubuntu"                       # Nome da instância
  }
}
 
