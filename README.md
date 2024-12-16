# DockerScript
1: Create a Vm ✨
2: Install Docker 🐳


# PROJECT COMMANDS:

# 1
To create the VM:

```shell
bash create-vm.sh
```

# 2
To transfer the Docker file from local to VM:

```shell
multipass transfer installDocker.sh super-cool-vm:/home/ubuntu
```

#3
To install Docker from your local machine:

```shell
multipass exec super-cool-vm -- bash installDocker.sh
```

# 4
To shell into your multipass VM: 

```shell
multipass shell super-cool-vm
```

# 5
To stop and delete the VM run this command:

```shell
multipass delete super-cool-vm --purge
```
