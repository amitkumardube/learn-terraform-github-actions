terraform {
 /* backend "remote" {
    organization = "terraform-associate-certification"
    workspaces {
      name = "gh-actions-demo"
    }
  }*/
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {

  project = "my-first-project-298218"
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "vm_instance" {
  //depends_on = [google_storage_bucket.example_bucket]
  name                      = var.instance_name
  machine_type              = var.instance_type
  tags                      = var.instance_tags
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  provisioner "local-exec" {
    command = "echo ${google_compute_instance.vm_instance.name} : ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  }
}