# DockerScript
1: Create a Vm ✨
2: Install Docker 🐳


# PROJECT COMMANDS:

# STEP ONE
Create the VM:

```shell
bash create-vm.sh
```



# STEP TWO
Transfer the Docker file from local to VM:

```shell
multipass transfer installDocker.sh super-cool-vm:/home/ubuntu
```


#STEP THREE
Go into the VM:

```shell
multipass shell super-cool-vm
```


#STEP FOUR
Run the installDocker script:

```shell
bash installDocker.sh
```


#STEP FIVE
Exit the VM:

```shell
exit
```


# STEP SIX
Delete the VM:

```shell
multipass delete super-cool-vm --purge
```
