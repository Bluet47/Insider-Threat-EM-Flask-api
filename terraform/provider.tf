terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.63.1"
    }
  }
}

provider "google" {
  project     = "flask-api-459518"
  region      = "europe-west2"
  zone        = "europe-west2-b"
}
