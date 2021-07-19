variable "cluster-name-base" {
  default = "Mykube"
}

variable "region" {
  type = string
  default = "asia-east1"
}

variable "zone" {
  default = "asia-east1-a"
}

variable "project" {
    type = string
	default = "sumit-gcp-278301"
}

variable "user" {
    type = string
	default = "2008.sumit@gmail.com"
}

variable "master_machine_type" {
  default = "e2-standard-4"
}

variable "node_machine_type" {
  default = "e1-standard-2"
}

variable "privatekeypath" {
    type = string
    default = "~/.ssh/id_ed25519"
}
variable "publickeypath" {
    type = string
    default = "~/.ssh/id_ed25519.pub"
}

// This token is used to establish trust between nodes in the cluster.  You can
// generate it with the following snippet:
//
//   python -c 'import random; print "%0x.%0x" % (random.SystemRandom().getrandbits(3*8), random.SystemRandom().getrandbits(8*8))'
//
// The token has to be in the form of '<6 chars>.<16 chars>'
variable "bootstrap_token" {
  default = ""
}

// variable "cidr" {
//  default = "10.20.0.0/16"
// }

variable "num-nodes" {
  default = 2
}
