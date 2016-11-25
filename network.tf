resource "google_compute_firewall" "default" {
  name    = "tf-k8s-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80","8080","5000","31728","32769"]
  }
  allow {
  	protocol = "udp"
  	ports    = ["500","4500"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["k8s-node"]
}