#---------------------------------------------------------
# Use existing sshkey
#---------------------------------------------------------
data "ibm_is_ssh_key" "sshkey" {
  name = var.ssh_keyname
}

data "ibm_is_ssh_key" "sshkey2" {
  name = var.ssh_keyname2
}

#---------------------------------------------------------
# Create instances in each subnet in zone1
#---------------------------------------------------------

resource "ibm_is_instance" "server-zone1" {
  name    = "${var.server-name}-${var.zone1}"
  image   = data.ibm_is_image.select_image.id
  profile = var.profile-server

  primary_network_interface {
    subnet = ibm_is_subnet.server-subnet-zone1.id
    security_groups = [ibm_is_vpc.vpc1.default_security_group]
  }
  
  vpc = ibm_is_vpc.vpc1.id
  zone = var.zone1
  keys = [data.ibm_is_ssh_key.sshkey.id, data.ibm_is_ssh_key.sshkey2.id]
  timeouts {
	create = "20m"
	update = "20m"
	delete = "20m"
  }
}

resource "ibm_is_instance_volume_attachment" "server-zone1" {
  instance = ibm_is_instance.server-zone1.id
  name                                = "data-vol-att-1"
  profile			      = "5iops-tier"
  capacity                            = 200
  delete_volume_on_attachment_delete  = true
  delete_volume_on_instance_delete    = true
  volume_name                         = "data-vol-att-1"

  //User can configure timeouts
  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

#-----------------------------------------------
# Assign floating IP to server instance in zon1
#-----------------------------------------------

resource "ibm_is_floating_ip" "server-zone1-fip" {
  name    = "${var.server-name}-${var.zone1}-fip"
  target  = ibm_is_instance.server-zone1.primary_network_interface[0].id
  }
  
