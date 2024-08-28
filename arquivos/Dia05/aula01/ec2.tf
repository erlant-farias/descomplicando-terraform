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
  
#  ebs_block_device {
#    device_name = "/dev/sdg"
#    volume_size = 5
#    volume_type = "gp2"
#    delete_on_termination = true
#  }
  dynamic "ebs_block_device" {
    for_each = var.blocks
    content {
      device_name = ebs_block_device.value["device_name"]
      volume_size = ebs_block_device.value["device_size"]
      volume_type = ebs_block_device.value["volume_type"]
    }
  }
  tags = {
    Name = "HelloWorld"
  }
}

