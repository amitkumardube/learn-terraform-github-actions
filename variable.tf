variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_tags" {
  type = list(any)
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "google_provider_credential" {
  type = string
}