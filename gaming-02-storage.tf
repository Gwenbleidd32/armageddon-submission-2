# Statefile Bucket
resource "google_storage_bucket" "raw" {
  project = var.project
  name = "${var.data_project}-bap"
  force_destroy = false
  uniform_bucket_level_access = true
  location = var.region
  labels = local.labels
}
#>>>

