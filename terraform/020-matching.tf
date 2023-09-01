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
