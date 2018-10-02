# Install Docker
# First install software-properties-common as it is needed to add-apt-repository command
sudo apt-get install software-properties-common
# Add the GPG key for the official Docker repository to the system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add the Docker repository to APT sources:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Next, update the package database with the Docker packages from the newly added repo:
sudo apt-get update
# Make sure you are about to install from the Docker repo instead of the default Ubuntu 16.04 repo:
apt-cache policy docker-ce
# You should see output similar to the follow:
# docker-ce:
#   Installed: (none)
#   Candidate: 17.03.1~ce-0~ubuntu-xenial
#   Version table:
#      17.03.1~ce-0~ubuntu-xenial 500
#         500 https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
#      17.03.0~ce-0~ubuntu-xenial 500
#         500 https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
# Finally, install Docker:
sudo apt-get install -y docker-ce
# Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it's running
sudo systemctl status docker
# Output
# ● docker.service - Docker Application Container Engine
#    Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
#    Active: active (running) since Sun 2016-05-01 06:53:52 CDT; 1 weeks 3 days ago
#      Docs: https://docs.docker.com
#  Main PID: 749 (docker)
# If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group
sudo usermod -aG docker ujnamss
# Install docker-machine
base=https://github.com/docker/machine/releases/download/v0.14.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo install /tmp/docker-machine /usr/local/bin/docker-machine

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose &&
  sudo chmod +x /usr/local/bin/docker-compose
