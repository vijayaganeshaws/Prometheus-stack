provider "aws" {
    region = "ap-southeast-2"
    access_key = "AKIAR3YF3ABRV45RFY3G"
    secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-0d147324c76e8210a"
    instance_type = "t2.micro"
  
}

resource "aws_eip" "lb" {
    vpc = true
  
}

resource "aws_eip_association" "eip_assoc" {
    instance_id = aws_instance.myec2.id
    allocation_id = aws_eip.lb.id
  
}
output "myec2" {
    value = aws_eip.lb.id
}