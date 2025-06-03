resource "aws_instance" "openproject" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    curl -fsSL https://get.docker.com -o install-docker.sh
    sudo sh install-docker.sh
    sudo usermod -aG docker ubuntu
    docker run -d -p 80:80 \
     -e OPENPROJECT_SECRET_KEY_BASE=secret \
     -e OPENPROJECT_HTTPS=false \
     openproject/openproject:15.4.1
  EOF

  tags = {
    Name = "openproject"
  }
}