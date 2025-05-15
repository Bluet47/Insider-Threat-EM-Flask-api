resource "google_project_service" "firestore" {
  project = var.project_id
  service = "firestore.googleapis.com"
}

# I orginaly manualay created the database the GPC only allows one defult db per project
#resource "google_firestore_database" "default" {
#  project     = var.project_id
#  name        = "(default)"
#  location_id = var.region
#  type        = "FIRESTORE_NATIVE"
#}

resource "google_service_account" "api_sa" {
  account_id   = "flask-api-sa"
  display_name = "Flask API Service Account"
}

resource "google_project_iam_member" "firestore_access" {
  project = var.project_id
  role    = "roles/datastore.user"
  member  = "serviceAccount:${google_service_account.api_sa.email}"
}

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
}
