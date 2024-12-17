#Set up Docker's apt repository in the following two steps:

# 2. Add Docker's official GPG key:

# See if apt-get exists. If so, update the repo.
if command -v apt-get; then
  echo 'Updating the apt package 🔄 '
  sudo apt-get update
else
  echo 'apt-get not found ❌'
fi

# Check if ca-certificates exists, if not, install it.
if apt-cache show 'ca-certificates'; then
  echo 'The ca-certificates package is already installed. 👏'
else
  echo 'Installing ca-certificates... ⏳'
  sudo apt-get install -y ca-certificates
fi

# Check if curl exists, if not, install it.
if apt-cache show 'curl'; then
  echo 'The curl package is already installed. 👏'
else
  echo 'Installing curl... ⏳'
  sudo apt-get install -y curl
fi

# Check if the keyrings directory exists & if not, create it
if [ -d /etc/apt/keyrings ]; then
  echo 'The keyrings directory already exists. 👌'
else
  echo 'The keyrings directory does not exist. Creating it...✨'
  sudo install -m 0755 -d /etc/apt/keyrings
fi

# Check if the Docker GPG key exists & if not, install it
if [ -f /etc/apt/keyrings/docker.asc ]; then
  echo 'The Docker GPG key already exists. 🔑'
else
  echo 'The Docker GPG key does not exist. Downloading it...⬇️'
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
fi

# Check read permissions for the Docker GPG key
if [ -r /etc/apt/keyrings/docker.asc ]; then
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
if (apt-cache search docker -ce | grep -q "docker-ce")
then
    echo "Docker reepository already exists in the cache."
else
    echo "Updating apt cache."
    sudo apt update
fi

#Install the latest version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin 
docker-compose-plugin

#Verify that the installation is successful by running the hello-world image:
sudo docker run hello-world

#Check the version of docker
if command -v docker > /dev/null 2>&1; then
  echo "Your Docker version is $(docker --version)"
else
  echo "Docker version could not be found."
fi

