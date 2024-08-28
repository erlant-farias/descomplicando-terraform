resource "aws_instance" "web" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = "subnet-xxxxxxx"
    key_name = "iassweek"
    vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]

    tags ={
        Name = "HelloWorld"
    }
    provisioner "remote-exec" {
      inline = [
        "touch /tmp/test",
       ]

      connection {
        type = "ssh"
        user = "root"
        host = "${self.public_ip}"
        private_key = "${file("/app/iaas.week.pem")}"
      }
    }
}
#        password = "${var.root_password}"
#        host = "${var.host}"