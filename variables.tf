variable vpc_cidr {  
  default     = "10.0.0.0/16"    
}

variable "project" {
    default =  "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        project = "expense"
        terraform = yes
    }
}