variable "hash_commit"{
    default = "81038021831902"
}

variable "environment" {
  default = "staging"
}


variable "blocks" {
  type = list(object({
    device_name = string
    volume_size = string
    volume_type = string
  }))
  description = "List of ebs block"
}