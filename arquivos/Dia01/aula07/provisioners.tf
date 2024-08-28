resource "aws_instance" "web" {
    provisioner "local-exec" {
      command = "echo 'The server's IP address is $(self.private_ip)'"
    }

    provisioner "local-exec" {
      when = "destroy"
      command = "echo 'Destroy-time provisioner'"
    }

    provisioner "local-exec" {
      on_failure = "continue"
      command = "echo 'Destroy-time provisioner'"
    }
}