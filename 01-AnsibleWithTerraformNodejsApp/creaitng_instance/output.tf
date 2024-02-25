output "IP_ADDRESS_1" {
  value = module.Ansible_instance[0].public_ip
}
output "DNS_NAME_1" {
  value = module.Ansible_instance[0].public_dns
}
output "IP_ADDRESS_2" {
  value = module.Ansible_instance[1].public_ip
}
output "DNS_NAME_2" {
  value = module.Ansible_instance[1].public_dns
}