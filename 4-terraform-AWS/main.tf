

# Unable to get permision to  get ami list
# data "aws_ami" "name" {
#   most_recent = true
#   filter {
#     name   = "name"
#     values = ["Amazon Linux*"]
#   }
# }

resource "aws_key_pair" "server_key" {
  key_name   = "server"
  public_key = file("./server-key.pub")

}

resource "aws_instance" "ubuntu_server" {
  instance_type = "t2.micro"
  ami           = "ami-007855ac798b5175e"
  tags = {
    "Name" = "Test_server"
  }
  key_name = aws_key_pair.server_key.key_name
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./server-key")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt upgrade -y",
      "DEBIAN_FRONTEND=nonintractive sudo apt install -y nginx"
    ]
  }
}
