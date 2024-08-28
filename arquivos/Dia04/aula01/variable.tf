variable "hash_commit"{
    default = "81038021831902"
}

variable "environment" {
  type = string
  default = "staging"
  description = "The environment of instance"
}

variable "plus" {
  default = 2
}

variable "production" {
  default = true
}

