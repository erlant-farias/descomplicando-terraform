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
  for_each = {
    dev = "t2.micro"
    staging = "t3.medium"
  }
  instance_type = each.value
  
  tags = {
    Name = "HelloWorld"
    Env = var.environment
  }
}

