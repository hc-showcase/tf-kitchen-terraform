resource "null_resource" "create_file" {
  provisioner "local-exec" {
    command = "echo 'this is my first test' > foobar"
  }
}

