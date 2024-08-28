data "aws_ami" "ubuntu" {
  most_recent = true 

  filter {
    name = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }
  owners = [ "901940194012" ] #myuser
}

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu.id 
  instance_type = "t2.micro"
  vpc_security_group_ids = var.sg
  tags = {
    Name = "HelloWorld"
    Env = var.environment
  }
}

