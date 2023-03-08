terraform {
  backend "gcs" {
    bucket = "kanvas-laravel-iaac"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = local.location
}

data "google_service_account" "kubernetes" {
  account_id = var.service_account_id
}