variable "network_acls_lookup" {
  description = <<EOT
Map of network_acls_lookup, attributes below
Optional:
    - region
    - tags
    - vpc_id
    - filter (block):
        - name (required)
        - values (required)
EOT

  type = map(object({
    region = optional(string)
    tags   = optional(map(string))
    vpc_id = optional(string)
    filter = optional(list(object({
      name   = string
      values = set(string)
    })))
  }))
}

