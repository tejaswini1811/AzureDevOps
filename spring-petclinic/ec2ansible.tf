provider "aws" {
  version = "~> 4.0"
  region  = "ap-northeast-2"
}

resource "aws_instance" "spc" {
    ami = "ami-0e735aba742568824"
    instance_type =  "t2.medium"
    key_name ="impkey"
    security_groups = "allclear"
    user_data = <<EOF
        #!/bin/bash
        apt update
        apt install software-properties-common
        add-apt-repository --yes --update ppa:ansible/ansible
        apt install ansible
    EOF
    tags = {
        "Name "= "spc1"
    }
    

}