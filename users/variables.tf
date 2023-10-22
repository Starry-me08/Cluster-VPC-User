variable "username" {
  type    = list(any)
  default = ["yusuf", "manager", "Ahniya"]
}

variable "env" {
  type    = list(any)
  default = ["Development", "Production"]
}

variable "tags" {
  type = map(string)
  default = {
    Env = "Development"
  }
}
