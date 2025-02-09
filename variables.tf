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
        terraform = true
    }
}
variable "database_cidr" {
    default = {}
    validation {
        condition = var.database_cidr == 2
        error_message = "please provide 2 valid db cidrs"
    }
}