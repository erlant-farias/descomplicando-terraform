variable "hash_commit"{
    default = "81038021831902"
}

variable "environment" {
  default = "staging"
}


variable "sg" {
  type = list(number)
  default = [ 1,2,3,4 ]
  description = "The list of sg for this"
}