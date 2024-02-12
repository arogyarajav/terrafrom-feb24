# Create a Null Resource and Provisioners

resource "null_resource" "null_name" {
   depends_on = [ module.ec2_public ]
   connection {
    type = "ssh"
    host = aws_eip.bastion_eip.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("privatekey/demo1_ec2.pem")
  } 
 # Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "privatekey/demo1_ec2.pem"
    destination = "/tmp/demo1_ec2.pem"
  }  

  # Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/demo1_ec2.pem",
      "ls -l /tmp/demo1_ec2.pem"
    ]
  }  

# local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
  provisioner "local-exec" {
    command = "echo VPC created on `date` and VPC ID: ${module.ec2_public.public_ip} >> creation-time-baston-ip.txt"
    working_dir = "local-exec-output-files/"
    on_failure = continue
    #when = destroy
  }
  /*
## Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)
  provisioner "local-exec" {
    command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
    #on_failure = continue
  }    
  */
}