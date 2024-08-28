data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["099720109477"] # Ubuntu

}

resource "aws_instance" "web" {
  count = var.servers
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = "subnet-xxxxxx"
  key_name = "iaasweek"

  tags = {
    Name = "HelloWorld"
  }
}