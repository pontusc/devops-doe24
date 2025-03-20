Contains all information to start custom gitlab runner for pipelines.
Start with command ```docker compose up -d```
Enter docker and run given command to register ```docker compose exec -it runner bash```
Set it up with specified git instance, docker and alpine:latest
Modify the config.toml to map correct volume ```volumes = ["/var/run/docker.sock:/var/run/docker.sock", "/cache"]
