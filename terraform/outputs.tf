output "vm_external_ip" {
  description = "External IP address of the Flask API VM"
  value       = google_compute_instance.flask_api_vm.network_interface[0].access_config[0].nat_ip
}
