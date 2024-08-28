resource "aws_instance" "web" {
  ami           = "ami-da-instancia"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}