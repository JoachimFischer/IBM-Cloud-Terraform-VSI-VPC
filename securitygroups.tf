#---------------------------------------------------------
# Create Webapptier Security Group & Rules
#---------------------------------------------------------
# resource "ibm_is_security_group" "server-securitygroup" {
#   name = "${var.vpc-name}-server-securitygroup"
#   vpc  = ibm_is_vpc.vpc1.id
# }

resource "ibm_is_security_group_rule" "sg-rule-in-tcp" {
  group     = ibm_is_vpc.vpc1.default_security_group
  direction  = "inbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
  tcp {
      port_min = 22
      port_max = 22
  }
}

resource "ibm_is_security_group_rule" "sg-rule-in-tcp1" {
  group     = ibm_is_vpc.vpc1.default_security_group
  direction  = "inbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
  tcp {
      port_min = 443
      port_max = 443
  }
}

resource "ibm_is_security_group_rule" "sg-rule-in-tcp2" {
  group     = ibm_is_vpc.vpc1.default_security_group
  direction  = "inbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
  tcp {
      port_min = 80
      port_max = 80
  }
}

  resource "ibm_is_security_group_rule" "sg-rule-in-icmp" {
  group     = ibm_is_vpc.vpc1.default_security_group
  direction  = "inbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
  icmp {
    type = 8
  }
}

resource "ibm_is_security_group_rule" "sg-rule-out-all" {
  group     = ibm_is_vpc.vpc1.default_security_group
  direction  = "outbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
}
