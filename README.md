## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| vault | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| eks-cluster | git@github.com:heruscode/terraform-aws-eks-cluster.git |  |

## Resources

| Name |
|------|
| [vault_aws_access_credentials](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/aws_access_credentials) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| endpoint\_private\_access | Indicates whether or not the Amazon EKS private API server endpoint is enabled. Default to AWS EKS resource and it is false | `bool` | `false` | no |
| endpoint\_public\_access | Indicates whether or not the Amazon EKS public API server endpoint is enabled. Default to AWS EKS resource and it is true | `bool` | `true` | no |
| kube\_exec\_auth\_credentials\_enabled | If `true`, pass `kube_exec_auth_aws_access_key_id`, `kube_exec_auth_aws_secret_access_key` and `kube_exec_auth_aws_session_token` as  `envs` to `aws eks get-token` | `bool` | `false` | no |
| kube\_exec\_auth\_enabled | If `true`, use the Kubernetes provider `exec` feature to execute `aws eks get-token` to authenticate to the EKS cluster.<br>Disabled by `kubeconfig_path_enabled`, overrides `kube_data_auth_enabled`. | `bool` | `false` | no |
| kubernetes\_config\_map\_ignore\_role\_changes | Set to `true` to ignore IAM role changes in the Kubernetes Auth ConfigMap | `bool` | `true` | no |
| kubernetes\_version | Desired Kubernetes master version. If you do not specify a value, the latest available version is used | `string` | `"1.15"` | no |
| map\_additional\_iam\_roles | Additional IAM roles to add to `config-map-aws-auth` ConfigMap | <pre>list(object({<br>    rolearn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | `[]` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| oidc\_provider\_enabled | Create an IAM OIDC identity provider for the cluster, then you can create IAM roles to associate with a service account in the cluster, instead of using kiam or kube2iam. For more information, see https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html | `bool` | `false` | no |
| region | AWS Region | `string` | n/a | yes |
| subnet\_ids | A list of subnet IDs to launch the cluster in | `list(string)` | n/a | yes |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| vault\_assume\_role | AWS role to generate credentials by Vault | `string` | `""` | no |
| vpc\_id | VPC ID for the EKS cluster | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_encryption\_config\_enabled | If true, Cluster Encryption Configuration is enabled |
| cluster\_encryption\_config\_provider\_key\_alias | Cluster Encryption Config KMS Key Alias ARN |
| cluster\_encryption\_config\_provider\_key\_arn | Cluster Encryption Config KMS Key ARN |
| cluster\_encryption\_config\_resources | Cluster Encryption Config Resources |
| eks\_cluster\_arn | The Amazon Resource Name (ARN) of the cluster |
| eks\_cluster\_certificate\_authority\_data | The Kubernetes cluster certificate authority data |
| eks\_cluster\_endpoint | The endpoint for the Kubernetes API server |
| eks\_cluster\_id | The name of the cluster |
| eks\_cluster\_identity\_oidc\_issuer | The OIDC Identity issuer for the cluster |
| eks\_cluster\_identity\_oidc\_issuer\_arn | The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account |
| eks\_cluster\_managed\_security\_group\_id | Security Group ID that was created by EKS for the cluster. EKS creates a Security Group and applies it to ENI that is attached to EKS Control Plane master nodes and to any managed workloads |
| eks\_cluster\_role\_arn | ARN of the EKS cluster IAM role |
| eks\_cluster\_version | The Kubernetes server version of the cluster |
| kubernetes\_config\_map\_id | ID of `aws-auth` Kubernetes ConfigMap |
| security\_group\_arn | ARN of the EKS cluster Security Group |
| security\_group\_id | ID of the EKS cluster Security Group |
| security\_group\_name | Name of the EKS cluster Security Group |
