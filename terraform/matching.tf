resource "humanitec_resource_definition_criteria" "criteria1" {
  resource_definition_id = humanitec_resource_definition.redis.id
  app_id                 = "app1"
}

resource "humanitec_resource_definition_criteria" "criteria2" {
  resource_definition_id = humanitec_resource_definition.redis.id
  app_id                 = "app2"
}

resource "humanitec_resource_definition_criteria" "criteria3" {
  resource_definition_id = humanitec_resource_definition.bucket.id
  app_id                 = "app2"
}

resource "humanitec_resource_definition_criteria" "criteria4" {
  resource_definition_id = humanitec_resource_definition.postgres.id
  app_id                 = "app3"
}


# Matching criteria for the target Kubernetes cluster
resource "humanitec_resource_definition_criteria" "cluster-app1" {
  resource_definition_id = var.k8s_resDef
  app_id                 = "app1"
}
resource "humanitec_resource_definition_criteria" "cluster-app2" {
  resource_definition_id = var.k8s_resDef
  app_id                 = "app2"
}
resource "humanitec_resource_definition_criteria" "cluster-app3" {
  resource_definition_id = var.k8s_resDef
  app_id                 = "app3"
}