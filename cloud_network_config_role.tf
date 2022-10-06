resource "aws_iam_role" "cloud_network_config_role" {
  name = "${var.operator_role_prefix}${var.cloud_network_config_role}${var.operator_role_suffix}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Condition = {
            StringEquals = {
                "rh-oidc.s3.us-east-1.amazonaws.com/${var.cluster_id}:sub" = ["system:serviceaccount:openshift-cloud-network-config-controller:cloud-network-config-controller"]
            }
        }
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/rh-oidc.s3.us-east-1.amazonaws.com/${var.cluster_id}"
        }
      },
    ]
  })

  tags = {
    rosa_cluster_id = var.cluster_id
    rosa_role_prefix = "ManagedOpenShift"
    operator_namespace = "openshift-cloud-network-config-controller"
    operator_name = "cloud-credentials"
  }
}

resource "aws_iam_role_policy_attachment" "cloud_network_config_role_policy_attachment" {
  role = aws_iam_role.cloud_network_config_role.name
  policy_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.network_config_controller_policy}"
}