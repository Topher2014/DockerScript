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
docker --version
