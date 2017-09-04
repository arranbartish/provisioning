# provisioning
Used to provision machines or a collection of machines


```
$ docker build -t provisioning .
$ docker run -v ~/.ssh:/ssh --name provision provisioning
$ docker run -v ~/.ssh:/ssh --env-file .env --name provision provisioning
```
