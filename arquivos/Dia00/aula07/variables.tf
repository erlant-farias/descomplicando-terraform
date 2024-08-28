variable "image_id" {
  default = "ami-hash"
  type = string
  description = "ami do ubuntu"


  validation {
    condition = length(var.image_id) > 4 && substr(var.image_id, 0,4) == "ami-"
    error_message = "A ami não tem um valor valido começando com \"ami-\"."
  }

  #sensitive = true (esconde parametros sensiveis)
}