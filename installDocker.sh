# Set up Docker's apt repository in the following two steps:

# 2. Add Docker's official GPG key:

# See if apt-get exists. If so, update the repo.
if command -v apt-get
then
  echo 'Updating the apt package 🔄 '
  sudo apt-get update
else
  echo 'apt-get not found ❌'
fi

# Check if ca-certificates exists, if not, install it.
if apt-cache show 'ca-certificates'
then
  echo 'The ca-certificates package is already installed. 👏'
else
  echo 'Installing ca-certificates... ⏳'
  sudo apt-get install -y ca-certificates
fi

# Check if curl exists, if not, install it.
if apt-cache show 'curl'
then
  echo 'The curl package is already installed. 👏'
else
  echo 'Installing curl... ⏳'
  sudo apt-get install -y curl
fi

# Check if the keyrings directory exists & if not, create it
if [ -d /etc/apt/keyrings ]
then
  echo 'The keyrings directory already exists. 👌'
else
  echo 'The keyrings directory does not exist. Creating it...✨'
  sudo install -m 0755 -d /etc/apt/keyrings
fi

# Check if the Docker GPG key exists & if not, install it
if [ -f /etc/apt/keyrings/docker.asc ]
then
  echo 'The Docker GPG key already exists. 🔑'
else
  echo 'The Docker GPG key does not exist. Downloading it...⬇️'
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
fi

# Check read permissions for the Docker GPG key
if [ -r /etc/apt/keyrings/docker.asc ]
then
  echo 'The Docker GPG key has the correct permissions. 👍'
else
  echo 'Setting correct permissions for the Docker GPG key... 🐳'
  sudo chmod a+r /etc/apt/keyrings/docker.asc
fi

# Check if the repository file exists, add it to Apt sources if it does not
if (stat /etc/apt/sources.list.d/docker.list)
then
   echo 'Repository already exists at /etc/apt/sources.list.d/docker.list'
else
   echo 'Repository not found. Adding repository.'
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

# Check cache for repo
if (apt-cache search docker-ce | grep -q "docker-ce")
then
    echo "Docker repository already exists in the cache."
else
    echo "Updating apt cache."
    sudo apt update
fi

# Install the latest version

# Check if the containerd.io package is in the apt-cache
if apt-cache show 'containerd.io'
then
  echo "The containerd.io package is in the apt-cache 👍"
else
  echo "containerd.io not found in the apt-cache. Updating the package list 🔄"
  sudo apt update
fi

# Check if the containerd.io package is installed
if dpkg -s containerd.io
then
  echo "containerd.io package is already installed. 👏"
else
  echo "Installing containerd.io... ⏳"
  sudo apt-get install -y containerd.io
  echo "containerd.io installation complete! ✅"
fi

# Install docker-ce
if (dpkg -l | grep -q docker-ce)
then
  echo "docker-ce is already installed"
else
  echo "Installing docker-ce"
  sudo apt-get install -y docker-ce
fi

# Install docker-ce-cli
if (dpkg -l | grep -q docker-ce-cli)
then
  echo "docker-ce-cli is already installed"
else
  echo "docker-ce-cli not installed, installing now"
  sudo apt-get install -y docker-ce-cli
fi

# Install docker-buildx-plugin
if (dpkg -l | grep -q docker-buildx-plugin)
then
  echo 'docker-buildx-plugin already installed'
else
  echo 'Installing docker-buildx-plugin'
  sudo apt-get install -y docker-buildx-plugin
fi

# Install docker compose
if (dpkg -l | grep -q docker-compose-plugin)
then
  echo "docker-compose-plugin is already installed"
else
  echo "docker-compose-plugin is not installed, installing it now"
  sudo apt-get install -y docker-compose-plugin
fi

# Post installation
sudo usermod -aG docker ubuntu

# Apply the group change in the current terminal session
<<<<<<< HEAD
if grep docker /etc/group
then
echo 'The docker group already exists'
else
echo 'Creating the 'docker' group'
sudo groupadd docker
fi
=======
newgrp docker 
>>>>>>> ef9c96610a0d32bac53475e2f16669b4eeefadd2
