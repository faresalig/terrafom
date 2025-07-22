
resource "aws_key_pair" "deve-key" {
  key_name   = "devekey"
  public_key = file("devekey.pub")
}

resource "aws_instance" "web" {
  ami                    = var.amis[var.region]
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.deve-key.key_name
  vpc_security_group_ids = [aws_security_group.deve-sg.id]
  availability_zone      = var.zone1
  tags = {
    Name    = "deve-web"
    project = "deve"
  }


  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt-get update -y",
  #     "sudo apt-get install -y software-properties-common",
  #     "sudo add-apt-repository universe",
  #     "sudo apt-get update -y",
  #     "sudo apt-get install -y apache2 unzip wget",
  #     "wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip",
  #     "unzip 2117_infinite_loop.zip",
  #     "sudo cp -r 2117_infinite_loop/* /var/www/html/",
  #     "sudo systemctl restart apache2"
  #   ]
  # }



  connection {
    user        = var.user
    private_key = file("devekey")
    host        = self.public_ip
  }

}

output "PublicIP" {
  value = aws_instance.web.public_ip
}

output "PrivateIP" {
  value = aws_instance.web.private_ip
}