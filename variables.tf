variable "endpoint_private_access" {
  type        = bool
  default     = false
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled. Default to AWS EKS resource and it is false"
}

variable "endpoint_public_access" {
  type        = bool
  default     = true
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. Default to AWS EKS resource and it is true"
}

variable "kubernetes_config_map_ignore_role_changes" {
  type        = bool
  default     = true
  description = "Set to `true` to ignore IAM role changes in the Kubernetes Auth ConfigMap"
}

variable "kube_exec_auth_credentials_enabled" {
  type        = bool
  default     = false
  description = "If `true`, pass `kube_exec_auth_aws_access_key_id`, `kube_exec_auth_aws_secret_access_key` and `kube_exec_auth_aws_session_token` as  `envs` to `aws eks get-token`"
}

variable "kube_exec_auth_enabled" {
  type        = bool
  default     = false
  description = <<-EOT
    If `true`, use the Kubernetes provider `exec` feature to execute `aws eks get-token` to authenticate to the EKS cluster.
    Disabled by `kubeconfig_path_enabled`, overrides `kube_data_auth_enabled`.
    EOT
}

variable "kubernetes_version" {
  type        = string
  default     = "1.15"
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version is used"
}

variable "map_additional_iam_roles" {
  description = "Additional IAM roles to add to `config-map-aws-auth` ConfigMap"

  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = []
}

variable "name" {
  type        = string
  default     = ""
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "oidc_provider_enabled" {
  type        = bool
  default     = false
  description = "Create an IAM OIDC identity provider for the cluster, then you can create IAM roles to associate with a service account in the cluster, instead of using kiam or kube2iam. For more information, see https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch the cluster in"
  type        = list(string)
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

variable "vault_assume_role" {
  type        = string
  default     = ""
  description = "AWS role to generate credentials by Vault"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the EKS cluster"
}