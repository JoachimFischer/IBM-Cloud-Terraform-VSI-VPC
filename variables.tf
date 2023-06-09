#---------------------------------------------------------
# MODIFY VARIABLES AS NEEDED
#---------------------------------------------------------
variable "ibmcloud_api_key" {}

#---------------------------------------------------------
## DEFINE sshkey to be used for compute instances
#---------------------------------------------------------
variable "ssh_keyname" {}
variable "ssh_keyname2" {}

#---------------------------------------------------------
## DEFINE VPC name and available Ressource Group (IAM)
#---------------------------------------------------------
variable "vpc-name" {
  description = "Provide the name of your VPC"
  default = "vpc-agorum"
}

 variable "resource_group" {
   description = "The Ressource Roup must be defined in IBM Cloud IAM"
   default = "default"
}

#---------------------------------------------------------
## DEFINE Region and Zones in US-South Dallas or
## Frankfurt region eu-de
## To switch regin via CLI:  $ibmcloud target -r us-south  
## or   ibmcloud target -r eu-de
#---------------------------------------------------------

variable "ibmcloud_region" {
  description = "Region of VPC like eu-de or us-south"
  default = "eu-de"
}
#---------------------------------------------------------
## can use us-south-1 / use-south-2 / use-south-3
## or eu-de-1 / eu-de-2 /eu-de-3
#----------------------------------------------------------
variable "zone1" {
  description = "use  eu-de-1 or us-south-1"
  default = "eu-de-1"
}

#---------------------------------------------------------
## DEFINE CIDR Blocks 172.21.0.0/21 for VPC in Regions
#---------------------------------------------------------
variable "vpc-address-prefix-1" {
  description = "The VPC address prefix"
  default = "172.21.0.0/24"
}

#---------------------------------------------------------
## DEFINE subnets for server in each zone
#---------------------------------------------------------
variable "server-subnet-zone-1" {
  default = "172.21.0.0/24"
}

#---------------------------------------------------------
## DEFINE OS image to be used for compute instances
## 
## You can generate the full list via CLI   $ibmcloud is images
## 
## "ibm-ubuntu-20-04-2-minimal-amd64-1"
## "ibm-windows-server-2012-r2-full-standard-amd64-6"
## "ibm-centos-7-0-minimal-amd64-1"
## "ibm-centos-8-2-minimal-amd64-2"
## "ibm-debian-9-9-minimal-amd64-2"
#---------------------------------------------------------
variable "select_image_name" {
  description = "use  ibm-debian-11-3-minimal-amd64-4  or select: $ibmcloud is images"
  default = "ibm-debian-11-3-minimal-amd64-4"
}

#---------------------------------------------------------
## DEFINE compute instance profile & quantity
## You can generate this list via CLI   $ibmcloud is instance-profiles
##
##   "bx2-16x64"
##   "bx2-2x8"
##   "cx2-16x32"
##   "cx2-2x4"
##   "cx2-32x64"
##   "cx2-4x8"
##   "cx2-8x16"
##   "mx2-16x128"
##   "mx2-2x16"
##   "mx2-32x256"
##   "mx2-4x32"
##   
#---------------------------------------------------------
variable "profile-server" {
  description = "use mx2-2x16 or select: $ibmcloud is instance-profiles"
  default = "mx2-2x16"
}

variable "server-name" {
  default = "agorum"
}

variable "server-count" {
  default = 1
}

