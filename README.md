# terraform-aws-rosa-sts-operator-roles

Create rosa operator roles and policies

In order to deploy [ROSA](https://docs.openshift.com/rosa/welcome/index.html) with [STS](https://docs.openshift.com/rosa/rosa_planning/rosa-sts-aws-prereqs.html). 

This terraform module tries to replicate rosa CLI roles/policies creation so that:

* Users have a declartive way to create operator roles

## Prerequisites

* AWS Admin Account
* Terraform CLI

## Usage

* Use default role and policy names

```
module sts_roles {
    source = "rh-mobb/rosa-sts-operator-roles/aws"
    operator_role_prefix = ""
    cluster_id = ""
}
```

* Customize role and policy names

```
module sts_roles {
    source = "rh-mobb/rosa-sts-operator-roles/aws"
    operator_role_prefix = ""
    operator_role_suffix = ""
    cluster_id = ""
    machine_api_policy = ""
    cloud_credential_operator_policy = ""
    network_config_controller_policy = ""
    image_registry_policy = ""
    ingress_operator_policy = ""
    csi_driver_policy = ""
    cloud_credential_role = ""
    cloud_network_config_role = ""
    csi_driver_role = ""
    ingress_role = ""
    machine_api_role = ""
    image_registry_role = ""
}
```