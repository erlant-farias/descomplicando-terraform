module "servers" {
  source = "./servers"
#  version = "value"
#  providers = {
#    
#  }
  servers = 2
}
output "ip_address" {
  value = module.servers.ip_address
}

resource "aws_route53_record" "server" {
  zone_id = "Z0204169XXXXXXXX"
  name = "server"
  type = "A"
  ttl = "300"
  records = [module.servers.ip_address[0]]
}