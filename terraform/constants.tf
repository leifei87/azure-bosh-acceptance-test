data "template_file" "base_storage_account_wildcard" {
  template = "boshvms"
}

data "template_file" "stemcells_table" {
  template = "stemcells"
}
