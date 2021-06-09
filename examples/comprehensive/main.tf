module "intersight_policy" {
  source = "./modules/terraform-intersight-policy"

  # external sources
  organization    = data.intersight_organization_organization.myorg.id
  vnic_mac_pool   = var.mac_pool_moid
  imc_access_pool = var.ip_pool_moid

  # every policy created will have this prefix in its name and this description
  policy_prefix = "my-first"
  description   = "Created by Terraform."

  # Fabric Interconnect 6454 config specifics
  server_ports_6454 = [17, 18, 19, 20]
  port_channel_6454 = [49, 50]
  uplink_vlans_6454 = {
    "vlan1020" : 1020,
    "vlan1021" : 1021
  }
  fc_port_count_6454 = 4

  imc_access_vlan    = 1020
  imc_admin_password = "Inters!ght"

  ntp_servers  = ["time-a-g.nist.gov", "time-b-g.nist.gov"]
  ntp_timezone = "America/Chicago"

  dns_preferred = "172.16.1.98"
  dns_alternate = "172.16.1.90"

  tags = [
    { "key" : "location", "value" : "austin" },
    { "key" : "orchestrator", "value" : "terraform" }
  ]
}