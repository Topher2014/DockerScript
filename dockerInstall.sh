#Set up Docker's apt repository in the following two steps:

# 1. Run the following command to uninstall all conflicting packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do 
sudo apt-get remove $pkg; done

# 2. Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] 
https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#Install the latest version going through each dependency
if which docker
  then 
    echo 'docker-ce already installed bitch'
  else 
    echo 'installing dicker-ce'
fi
if dpkg -l | grep -qw docker-ce-cli
  then 
    echo 'docker-ce-cli is already installed'
  else 
    echo 'installing docker ce-cli'
    sudo apt-get install -y docker-ce-cli
fi
if dpkg -l | grep -qw containerd.io
  then 
    echo
  else
    echo "Installing containerd.io"
    sudo apt-get install -y containerd.io
fi
if dpkg -l | grep -qw docker-buildx-plugin
  then
    echo "docker-buildx-plugin is already installed"
  else
    echo "Installing docker-buildx-plugin"
    sudo apt-get install -y docker-buildx-plugin
fi
if dpkg -l | grep -qw docker-compose-plugin
  then
    echo "docker-compose-plugin is already installed"
  else
    echo "Installing docker-compose-plugin"
    sudo apt-get install -y docker-compose-plugin
fi

#Verify that the installation is successful by running the hello-world image:
sudo docker run hello-world

#Check the version of docker
docker --version
