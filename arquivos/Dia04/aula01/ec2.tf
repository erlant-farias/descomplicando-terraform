data "aws_ami" "ubuntu" {
  most_recent = true 

  filter {
    name = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }
  owners = [ "901940194012" ] #myuser
}

resource "aws_instance" "web" {
  count = var.environment == "production" ?  2 + var.plus : 1
  ami = data.aws_ami.ubuntu.id 
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"

  }
}
resource "aws_instance" "web2" {
  count = var.production ?  2 : 1
  ami = data.aws_ami.ubuntu.id 
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "web3" {
  count = var.production ?  2 : 1
  ami = data.aws_ami.ubuntu.id 
  instance_type = count.index < 1 ? "t2.micro" : "t3.medium"

  tags = {
    Name = "HelloWorld"
  }
}
