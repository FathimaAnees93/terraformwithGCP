terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.4.0"
    }
  }
}

provider "google" {
  project ="teraformvm"
  region = "us-central1(lowa)"
  credentials = file("./keys.json")
}