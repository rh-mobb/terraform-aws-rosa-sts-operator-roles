variable cluster_id {
    type = string
}

variable operator_role_prefix {
    type = string
}

variable operator_role_suffix {
    type = string
    default = ""
}

variable rh_oidc_provider_thumbprint {
    description = "Thumbprint for https://rh-oidc.s3.us-east-1.amazonaws.com"
    type = string
    default = "917e732d330f9a12404f73d8bea36948b929dffc"
}

variable rh_oidc_provider_url {
    description = "oidc provider url"
    type = string
    default = "https://rh-oidc.s3.us-east-1.amazonaws.com"
}

variable network_config_controller_policy {
    type = string
    default = "ManagedOpenShift-openshift-cloud-network-config-controller-cloud"
}

variable machine_api_policy {
    type = string
    default = "ManagedOpenShift-openshift-machine-api-aws-cloud-credentials"
}

variable cloud_credential_operator_policy {
    type = string
    default = "ManagedOpenShift-openshift-cloud-credential-operator-cloud-crede"
}

variable image_registry_policy {
    type = string
    default = "ManagedOpenShift-openshift-image-registry-installer-cloud-creden"
}

variable ingress_operator_policy {
    type = string
    default = "ManagedOpenShift-openshift-ingress-operator-cloud-credentials"
}

variable csi_driver_policy {
    type = string
    default = "ManagedOpenShift-openshift-cluster-csi-drivers-ebs-cloud-credent"
}

variable cloud_credential_role {
    type = string
    default = "openshift-cloud-credential-operator-cloud-c"
}

variable cloud_network_config_role {
    type = string
    default = "openshift-cloud-network-config-controller-c"
}

variable csi_driver_role {
    type = string
    default = "openshift-cluster-csi-drivers-ebs-cloud-cre"
}

variable image_registry_role {
    type = string
    default = "openshift-image-registry-installer-cloud-cr"
}

variable ingress_role {
    type = string
    default = "openshift-ingress-operator-cloud-credential"
}

variable machine_api_role {
    type = string
    default = "openshift-machine-api-aws-cloud-credentials"
}
