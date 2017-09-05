# provisioning
Used to provision machines or a collection of machines


# Usage
For testing setup an empty VM on 10.0.2.2

## VM Requirments

 - key based athentication with a public key in the authorized hosts

## Executung machine requirements

- Directory with the private key corisponding to the public key on the target machine
- Properly configured ssh `config` file, like the some below, in the same directory. Ensure that the host, user, and ssh port actually match the target machine
```
Host docker-node
    HostName 10.0.2.2
    user arran
    port 2222
```

## Building the container

```
$ docker build -t provisioning .
```

## Running the container as a process

```
$ docker run -v ~/.ssh:/ssh -v ~/dev/provisioning/files:/files --env-file .env --name provision provisioning
$ docker exec -u 0 -it <CONTAINER ID> /bin/bash
```
## Execute adhoc commands through the container

```
$ docker run  --rm  -v ~/.ssh:/ssh --env-file .env provisioning "ansible-playbook files/playbook.yml -i files/hosts && ssh docker-node 'cat hello-world.txt'"
```

