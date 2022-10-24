// Teraform configuration
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker" // shorthand for registry.terraform.io/kreuzwerker/docker
      version = "~> 2.13.0"          // Automatically downloads the most recent
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.container_name
  ports {
    internal = 80
    external = 8080
  }
}