data "aws_ami" "ubuntu" {
  most_recent  = true

  filter {
    name    = "name"
    values  = ["IaaSWeek-${var.hash_commit}"]
  }

  owners  = ["178520105998"]
}

resource "aws_instance" "ranchersrv" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags  = {
    Name  = "ranchersrv"
  }
}

resource "aws_instance" "k8s" {
  count = var.instances_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags  = {
    Name  = "k8s-${count.index + 1}"
  }
}
