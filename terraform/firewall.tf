resource "google_compute_firewall" "kubernetes_ingress_rules" {
  name      = "${var.cluster_name}-${terraform.workspace}-ingress-rules"
  network   = var.network_name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["3306", "6379", "5672", "587", "9200"]
  }

  target_tags = ["memod-node"]

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "kubernetes_egress_rules" {
  name      = "${var.cluster_name}-${terraform.workspace}-egress-rules"
  network   = var.network_name
  direction = "EGRESS"

  allow {
    protocol = "tcp"
    ports    = ["3306", "6379", "5672", "587", "9200"]
  }

  target_tags = ["memod-node"]

  destination_ranges = ["0.0.0.0/0"]
}