# DockerScript
1: Create a Vm ✨
2: Install Docker 🐳


# PROJECT COMMANDS:

# STEP ONE
To create the VM:

```shell
bash create-vm.sh
```


# STEP TWO
To transfer the Docker file from local to VM:

There are two ways to do this...

## 1 
Transfer the file:

```shell
multipass transfer installDocker.sh super-cool-vm:/home/ubuntu
```

Then manually shell into the VM:

```shell
multipass shell super-cool-vm
```

## 2
Transfer the file and automatically shell into the VM:

```shell
multipass exec super-cool-vm -- bash installDocker.sh
```


# STEP 3
To stop and delete the VM run this command:

```shell
multipass delete super-cool-vm --purge
```
