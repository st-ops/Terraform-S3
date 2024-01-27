variable "bucket_name" {
    type = string
    description = "Please provide a globally unique name for your bucket."
}


variable "versioning" {
    type = bool
    description = "Enter true to enable versioning. Has False as value by default"
    default = false
}

variable "public_acl" {
    type = bool
    description = "Set to true to enable Public"
    default = false
}