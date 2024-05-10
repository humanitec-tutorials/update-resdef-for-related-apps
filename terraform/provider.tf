terraform {
  required_providers {
    humanitec = {
      source = "humanitec/humanitec"
    }
  }

}
provider "humanitec" {
  org_id = var.org
  token  = var.token
  host   = "https://api.humanitec.io"
}


variable "org" {
}

variable "token" {
}

variable "k8s_resDef" {
}