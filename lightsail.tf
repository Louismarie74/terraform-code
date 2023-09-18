resource "aws_lightsail_instance" "example" {
  name              = "Apache_server"
  availability_zone = "us-east-1b"  # Change to your desired availability zone
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "micro_2_0"
  #key_pair_name     = "week2"  # Replace with your SSH key pair name
  #user_data = <<-EOF
  #            #!/bin/bash
  #            sudo yum install httpd -y
  #            sudo systemctl start httpd
  #            sudo systemctl enable httpd
  #            echo "<h1>This Server is created using Terraform</h1>" | sudo tee /var/www/html/index.html
  #            EOF
  user_data         = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>Deployed via Terraform</h1>' | sudo tee /var/www/html/index.html"
}

output "public_ip" {
  value = aws_lightsail_instance.example.public_ip_address
}