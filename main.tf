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
  user_data     = <<-EOF
                    #!/bin/bash
                    cd /home/ubuntu/.ssh/
                    echo " -----BEGIN OPENSSH PRIVATE KEY-----
                          b3BlbnNzaC1rZXktdjEAAAAACmFlczI1Ni1jdHIAAAAGYmNyeXB0AAAAGAAAABCzEOn9RT
                          KTz0RcxbYKRAoDAAAAEAAAAAEAAAGXAAAAB3NzaC1yc2EAAAADAQABAAABgQDegaIerOcP
                          4QiUEOjKmzjBtNo6FgK0WCkh4d5sklfoxJXIkZFk1gTE0eQelC1UA+T9VPGfpEJuu06Rj2
                          6TLnvY7brnEtlQoi8C0G53+LDEVRA5T3KaB8nSOwpbX7DhhoB0EmgnVUfSZ/nuvSH6caxg
                          GaaqlmQd7fHPzJ5iEEBsG0qlJ0XiTwWpzV2vUUKoHmX5FpJC0PWCXgkiAUb0Xhw+WNj3Ia
                          0Vy9Qfy2/fwKD+SBDODKdUb6D+QLrxNpya4RgByMXcfwl6/nnqNSHYYD83zpemo+IG45bX
                          9iSOsa4jiFmgYBDEE9OsOi/hAVGp4I0YxuYK8DjtP9gpZvJDMiux9NTN4imok/azOSYpEB
                          QI5iNeWeHX4S52k3bTd8olOCw2t+V5OBJasuDDbdUoXnAkuGiGCI9sWCoM+wizz8n//OJo
                          DRplLr5hzkiyIvANR5C72FGXRsJ7EyWXJV8MTO6GDYr7QwsoXT/UAJnXnqev9h8S6gXxIz
                          si5pdFZnhEIREAAAWQnvg/Zn+kSGVth/MlnMYEJxYac8vpo9alWTezQEpZMqGfEyp9AMKG
                          ydmgpYAmAgjctqGlEhxI6IeqhHR4Pta0UNrJ4kTmmFf0jzDkRPvWAygVY3cdgt5moPZKsN
                          /Njt8I6feyz5bCBFosRrKspUlwJ0JYfOhEk+JSDWSbY1xSlKRoGkH5/FFqJn+IYMRPkqhM
                          sZOcSzfRMbyvoUaE8UsyTF+/P6Qll6uaIpqBsFaAVJrZKL83YQ8ghaiTvUrrU8rKhq38My
                          ZtsKSNUYwXypAl6UEGNfNf+hHtvfuAFtOdwgLgtGHwLdVSmwQe1aOg66OAy6g7Fo0PhfzI
                          ny+tPmDqSbQgp47kvUYz3O4qgsjQGryjrre57tNLwkqPYVOF30IPgoSp4H796uJENeb5iu
                          ePTgGakHT4UQm8ovYWjg/J3iewvM+L8ArQTZx+7mHrGokKZMWo7A3JQ1+5KTaVSTj8w0QU
                          M2bl1hiuliRrnmy8l+zvnGzzKJQLFlKFyx3VKtu7Ozgf4N6cBsS+CKyhUMiBDqNrs7lgY0
                          jxTB1bQBU3FLa5tVRHtNLRI9ZIwf5eRzUWklTtE1xnoOdr+B7x77ZE6EDVPUVD3jOC1AvV
                          vwAB6pnTJjqoKDuEfbJTSZP+GGiH/yTxDYWL6ysZis9OwIg7Ygxil4qYXEcVKFPLN8YYHF
                          IOfXYjpcNFfFY99BG7eJq7BqnKqfGcY8j8PgGAAbAIAebum5QKcNW//ri1SP8CuGNQ5kGL
                          nb/6nlVzU0IHVyyCyUVPCHPvOcxv1QOMEy2ELjVUDH2y4XoMda3Ep5+pPniyzDWpXWTTnR
                          4W4QxtzJIU6HD2xBJ4Jg6kwq84MKQBJuopw0fbJAmRVOO4/mn8F7FLnAM4J5cEhitXmVU4
                          ZKkENP+kgrC2lILVUCARBTFX7eND/FhhXsrz/gXJW6zOfYSISVsOKkt5U57gxka6oPJyjv
                          RpH5CrekykcPDeNHRy7LffyLcoop7D6HYOqxpW5WgjKJveWv35H3JVbj1VGue0WORiKKNO
                          JdYhDQu2LvPyst9aSZXmIz02n8Gik33XhPQHbzVGef7rML4RBKltHFwdWt1u3GaflZ1/oE
                          iXhmh1Z5xkYbUxLfAX+8CCH954Mxm9L63DdJSiPZ89r9iWq0v+yYcUGnVcR620+mSFveJ3
                          LHyBgcLvBuC+YS+Okm2Cy//871rHLPUU86/pg/6ITW3jk0nbu5HpULvXCzvIeC9LJWRBgW
                          4qq2pjJqYA/IkiX9udrAL281Sa9GLCPIApM6WFufNF2Vj+IaBRSdVmeHefothlMDWkRI91
                          qMqGzjPkYvaCXf+88epPEPl5Fb9Lyf+ao6hqYmJovDOKoR2FLaZesIDAWizkpQ8Y9TmXkU
                          tqnhDNNXGF1iyMqqEe0bgz1wMpAXi45wUFLAGPpvEgwsMchA+pnyMU76aTzXcqw9pfKq9Q
                          dnAIUMmjlCqk1tAOzx8biuiXQxy06oXrRvPrfK4BV09pfyPnTYWXTEubf2oHvGxNUbid7w
                          w23csjWuX8+pzYvJikIAD/65jKU6oK/ubv7XnWOaAoMhJKJD4nOVRZJfAbC1JkgUlmP6FJ
                          KzGhYPpLIwidlRRcaPrsDtUvgTEsS1NzlEoeVtDPakNom7ZaTQOCE3mE6x/YRZvCdAs9l/
                          lkV+2a+5SzkJYzbCeiuIpc7kXcRfrSz8gaelWibumBcGTr1y9WtvNidGoO4nY+1d0mnyMM
                          1e3LTPAG2RkgSgmQ/1CeGL6oWIPSNYk10HpcFzV6xovuHpYkcTF/bMHxn8yA1pBklcRk3+
                          +TDuchoLDvebBhLKj9jgVAH/0We1uD/FecIXrzbAlRS8DlI3vIw9pN5RNrH2POM4jD4eQU
                          2MHIJAOYB+EmpppHEV2hoEolEzs=
                          -----END OPENSSH PRIVATE KEY-----" > id_rsa

                          echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDegaIerOcP4QiUEOjKmzjBtNo6FgK0WCkh4d5sklfoxJXIkZFk1gTE0eQelC1UA+T9VPGfpEJuu06Rj26TLnvY7brnEtlQoi8C0G53+LDEVRA5T3KaB8nSOwpbX7DhhoB0EmgnVUfSZ/nuvSH6caxgGaaqlmQd7fHPzJ5iEEBsG0qlJ0XiTwWpzV2vUUKoHmX5FpJC0PWCXgkiAUb0Xhw+WNj3Ia0Vy9Qfy2/fwKD+SBDODKdUb6D+QLrxNpya4RgByMXcfwl6/nnqNSHYYD83zpemo+IG45bX9iSOsa4jiFmgYBDEE9OsOi/hAVGp4I0YxuYK8DjtP9gpZvJDMiux9NTN4imok/azOSYpEBQI5iNeWeHX4S52k3bTd8olOCw2t+V5OBJasuDDbdUoXnAkuGiGCI9sWCoM+wizz8n//OJoDRplLr5hzkiyIvANR5C72FGXRsJ7EyWXJV8MTO6GDYr7QwsoXT/UAJnXnqev9h8S6gXxIzsi5pdFZnhEIRE= ubuntu@ip-172-31-13-31" > id_rsa.pub
                          cd /home/ubuntu/
                          git clone git@github.com:nerimarcelo/curso-git-alura.git
                          git checkout web-server
                          echo "Feito com o Terraform" > index2.html
                          nohup busybox httpd -p 8080 &
                    
                    EOF
  tags = {
    Name = "alura-aws-ubuntu"                       # Nome da instância
  }
}
 
