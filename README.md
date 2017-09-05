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

### Using the built image described above

```
$ docker run  --rm  -v ~/.ssh:/ssh --env-file .env provisioning "ansible-playbook files/playbook.yml -i files/hosts && ssh docker-node 'cat hello-world.txt'"
```

### using the latest pre-built image available on docker-hub

```
$ docker run  --rm  -v ~/.ssh:/ssh --env-file .env arranbartish/provisioning "ansible-playbook files/playbook.yml -i files/hosts && ssh docker-node 'cat hello-world.txt'"
```

The above command will execute using the package "default" inventory and playbook in the image.

### Customizing the process

You can mount custom inventory and playbooks in a volume and use them from the same image.

```
$ docker run  --rm  -v ~/.ssh:/ssh -v ~/dev/provisioning/files:/files --env-file .env arranbartish/provisioning "ansible-playbook /files/playbook.yml -i /files/hosts && ssh docker-node 'cat hello-world.txt'"
```
