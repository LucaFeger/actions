# GitHub Action for deploying Docker containers

The GitHub Action allows to automatically deploy your application as a docker container to your server.

![Image of Yaktocat](https://i.imgur.com/Gm3HW2N.png)

## Usage

```
action "package" {
  uses = "LucaFeger/actions/docker-deploy@master"
  args = "lucafeger/node-hello-world"
  env = {
    DOCKER_PARAMETERS  = "-p 1234:8081 --name=my-application"
  }
  secrets = [
    "PRIVATE_KEY",
    "PUBLIC_KEY",
    "HOST",
    "USER",
    "DOCKER_USERNAME",
    "DOCKER_PASSWORD"
  ]
}
```

## Required Arguments
The name of the docker image that will be run

## Possible Environments Variables
* **DOCKER_PARAMETERS** the parameters the docker container should be started with

## Required Secrets
* **PRIVATE_KEY** A ssh private key that has access to the deployment server
* **PUBLIC_KEY** A ssh public key that has access to the deployment server
* **HOST** The host of the deployment server
* **USER** The user that will be used to run commands on the deployment server 
* **DOCKER_USERNAME** Your Dockerhub username
* **DOCKER_PASSWORD** Your Dockerhub password

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE.md).