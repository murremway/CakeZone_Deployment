provider "aws" {
  region  = "us-east-1"
}



resource "aws_instance" "ec2_jenkins" {
  ami           = "ami-08fdec01f5df9998f"
  instance_type = "t2.xlarge"
  key_name      = "class"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  user_data              = file("jenkins.sh")

  tags = {
    "Name" : "Jenkins"
  }
}

resource "aws_instance" "ec2_sonarqube" {
  ami           = "ami-08fdec01f5df9998f"
  instance_type = "t2.medium"
  key_name      = "class"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  tags = {
    "Name" : "SonarQube"
  }
}


resource "aws_instance" "ec2_artifactory" {
  ami           = "ami-08fdec01f5df9998f"
  instance_type = "t2.medium"
  key_name      = "class"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  user_data              = file("jfrog.sh")

  tags = {
    "Name" : "JFROG"
  }
}