resource "aws_iam_openid_connect_provider" "oidc_provider" {
  url = "${var.rh_oidc_provider_url}/${var.cluster_id}"

  client_id_list = [
    "openshift",
    "sts.amazonaws.com"
  ]

  tags = {
    rosa_cluster_id = var.cluster_id
  }

  thumbprint_list = [var.rh_oidc_provider_thumbprint]
}