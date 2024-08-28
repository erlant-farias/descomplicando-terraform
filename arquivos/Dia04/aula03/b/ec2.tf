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
  for_each = toset(var.instance_type)
  instance_type = each.value
  
  tags = {
    Name = "HelloWorld"
  }
}

