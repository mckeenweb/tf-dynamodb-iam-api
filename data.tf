#fetching my_ip code
data "http" "my_public_ip" {
  url = "https://ifconfig.me/ip" # or use any other service that returns your public IP
}

locals {
  my_public_ip = "${data.http.my_public_ip.response_body}/32" #${chomp(data.http.my_public_ip.body)}/32
}
#Output my_ip
output "my_ip" {
  value = local.my_public_ip
  
}