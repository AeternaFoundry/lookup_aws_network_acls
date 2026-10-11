data "aws_network_acls" "network_acls_lookup" {
  for_each = var.network_acls_lookup

  region = each.value.region
  tags   = each.value.tags
  vpc_id = each.value.vpc_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

