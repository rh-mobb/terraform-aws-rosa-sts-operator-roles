resource "aws_iam_role" "ingress_operator_role" {
  name = "${var.operator_role_prefix}${var.ingress_role}${var.operator_role_suffix}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Condition = {
            StringEquals = {
                "rh-oidc.s3.us-east-1.amazonaws.com/${var.cluster_id}:sub" = ["system:serviceaccount:openshift-ingress-operator:ingress-operator"]
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
    operator_namespace = "openshift-ingress-operator"
    operator_name = "cloud-credentials"
  }
}

resource "aws_iam_role_policy_attachment" "ingress_operator_role_policy_attachment" {
  role = aws_iam_role.ingress_operator_role.name
  policy_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.ingress_operator_policy}"
}