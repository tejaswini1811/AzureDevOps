data "aws_security_group" "allclear" {
  id = "sg-060cfe73b370e475d"
}
resource "aws_instance" "spc" {
    ami = "ami-0e735aba742568824"
    instance_type =  "t2.medium"
    key_name ="impkey"
    subnet_id = "subnet-00682982ef1ca219a"
    security_groups = [data.aws_security_group.allclear.id]
    user_data = "${file("install_ansible.sh")}"
    tags = {
        Name = "spc1"
    }
    

}