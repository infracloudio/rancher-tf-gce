output "master.ip" {
  value = "${google_compute_instance.rancher.0.network_interface.0.access_config.0.assigned_nat_ip}"
}