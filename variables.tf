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
variable "database_cidrs" {
    default = {}
    validation {
        condition = length(var.database_cidrs) == 2
        error_message = "please provide 2 valid db cidrs"
    }
}

variable "private_cidrs" {
    default = {}
    validation {
        condition = length(var.private_cidrs) == 2
        error_message = "please provide 2 valid private cidrs"
    }
}

variable "public_cidrs" {
    default = {}
    validation {
        condition = length(var.public_cidrs) == 2
        error_message = "please provide 2 valid public cidrs"
    }
}

variable "is_peering_required" {
    type =  bool    
}
variable "peer_owner_id" {
    default = {}
}