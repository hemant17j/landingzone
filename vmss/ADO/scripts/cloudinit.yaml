#cloud-config

package_update: true
package_upgrade: true

groups:
  - docker

system_info:
  default_user:
    groups: [ docker ]

packages:
  - apt-transport-https
  - ca-certificates
  - curl
  - zip
  - unzip
  - gnupg
  - lsb-release
  - unattended-upgrades
  - software-properties-common
  - python3
  - python3-pip
  - libssl-dev

runcmd:

  # Docker repository
  - mkdir -p /etc/apt/keyrings
  - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  - echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

  # Python 3.10 repository
  - add-apt-repository -y ppa:deadsnakes/ppa

  # Update repositories
  - apt-get update

  # Docker
  - apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

  # Python 3.10
  - apt-get install -y python3.10 python3.10-venv python3.10-dev python3-pip
  - update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

  # Docker service
  - systemctl enable docker
  - systemctl start docker

  # Istioctl
  - curl -L https://istio.io/downloadIstio | sh -
  - mv istio-*/bin/istioctl /usr/local/bin/

  # kubectl
  - curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  - install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

  # Terraform
  - curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  - echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
  - apt-get update
  - apt-get install -y terraform

  # Helm
  - curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

  # Azure CLI
  - curl -sL https://aka.ms/InstallAzureCLIDeb | bash

final_message: "Azure DevOps agent VMSS initialization completed after $UPTIME seconds"
