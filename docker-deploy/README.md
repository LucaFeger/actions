# GitHub Action for deploying Docker containers

The GitHub Action allows to automatically deploy your application as a docker container to your server.

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
    "USER"
  ]
}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE.md).