data "vault_aws_access_credentials" "vault_creds" {
  backend = "aws"
  type    = "sts"

  role = var.vault_assume_role
}

module "eks-cluster" {
  source = "git@github.com:heruscode/terraform-aws-eks-cluster.git"

  name               = var.name
  vpc_id             = var.vpc_id
  subnet_ids         = var.subnet_ids
  region             = var.region
  kubernetes_version = var.kubernetes_version

  endpoint_private_access = var.endpoint_private_access
  endpoint_public_access  = var.endpoint_public_access
  oidc_provider_enabled   = var.oidc_provider_enabled

  kubernetes_config_map_ignore_role_changes = var.kubernetes_config_map_ignore_role_changes
  map_additional_iam_roles                  = var.map_additional_iam_roles

  kube_exec_auth_enabled               = var.kube_exec_auth_enabled
  kube_exec_auth_credentials_enabled   = var.kube_exec_auth_credentials_enabled
  kube_exec_auth_aws_access_key_id     = data.vault_aws_access_credentials.vault_creds.access_key
  kube_exec_auth_aws_secret_access_key = data.vault_aws_access_credentials.vault_creds.secret_key
  kube_exec_auth_aws_session_token     = data.vault_aws_access_credentials.vault_creds.security_token

  tags = var.tags
}