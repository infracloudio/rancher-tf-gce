provider "google" {
  credentials = "${file("${var.credentials_file_path}")}"
  project     = "${var.project}"
  region      = "${var.region}"
}