#Active Storage Buckets
#>>>

resource "google_storage_bucket" "bucket1" {
  name     = "huckelberry-finn"
  location = "europe-central2"
  force_destroy = true
}

# Set the bucket-level IAM policy to allow public read
resource "google_storage_bucket_iam_binding" "public_read" {
  bucket = google_storage_bucket.bucket1.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers",
  ]
}

# Upload local files to the folder inside the bucket
resource "google_storage_bucket_object" "o1" {
  name   = "mainframe.html"
  bucket = google_storage_bucket.bucket1.name
  source = "C:/Users/User/Desktop/Homework/Landing Page Setup/g-sketch/mainframe.html"
  depends_on = [ google_storage_bucket.bucket1 ]
  content_type = "text/html"
}



output "object1_url" {
  description = "The public URL of the first object"
  value       = "https://storage.googleapis.com/${google_storage_bucket.bucket1.name}/${google_storage_bucket_object.o1.name}"
}

resource "local_file" "task-1-output" {
  content  = "Object 1 URL: https://storage.googleapis.com/${google_storage_bucket.bucket1.name}/${google_storage_bucket_object.o1.name}"
  filename = "${path.module}/output.txt"
}