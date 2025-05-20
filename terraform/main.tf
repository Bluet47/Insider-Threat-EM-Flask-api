# Enable Firestore API
resource "google_project_service" "firestore" {
  project = var.project_id
  service = "firestore.googleapis.com"
}

# Service Account for the Flask API
resource "google_service_account" "api_sa" {
  account_id   = "flask-api-sa"
  display_name = "Flask API Service Account"
}

# IAM binding to allow Firestore access
resource "google_project_iam_member" "firestore_access" {
  project = var.project_id
  role    = "roles/datastore.user"
  member  = "serviceAccount:${google_service_account.api_sa.email}"
}

# Compute VM Instance
resource "google_compute_instance" "flask_api_vm" {
  name         = "employee-api-vm"
  machine_type = "e2-micro"
  zone         = "europe-west2-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = file("startup.sh")

  service_account {
    email  = google_service_account.api_sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  tags = ["http-server"]  #  So the firewall rule applies to this VM
}

# Firewall Rule to allow HTTP traffic
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]  #  Must match VM's tag
}
