###################################################
# GitHub Actions Runner Cloud-Init
###################################################

data "local_file" "github_cloudinit" {
  filename = "${path.module}/scripts/cloudinit.yaml"
}

