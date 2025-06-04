# ssh-docker-vscode

Docker container setup with an SSH server, allowing remote access for development.  
This setup enables connecting to the container via VS Code Remote - SSH extension for a smooth remote coding and debugging experience.

## Features

- Runs an SSH server inside a Docker container.
- Allows remote SSH connections from VS Code.
- Pre-configured environment for development inside the container.
- Persistent volumes can be added for data persistence (optional).

## Prerequisites

- Docker and Docker Compose installed on your machine.
- VS Code installed with the **Remote - SSH** extension.
- Basic knowledge of SSH and Docker.

## Usage

### 1. Build and start the container

```bash
docker compose up -d --build
````

This command will build the Docker image (if needed) and start the container with the SSH server running.

### 2. Check running containers

```bash
docker ps
```

You should see your container running and exposing the SSH port (e.g., 2222).

### 3. Connect via SSH (optional)

You can test the SSH connection using either `localhost` or the specific IP address of the host machine:

```bash
ssh -p 2222 root@localhost
```

or

```bash
ssh -p 2222 root@<HOST_IP_ADDRESS>
```

Replace `<HOST_IP_ADDRESS>` with the actual IP address of your host machine.

Use the password or SSH key configured in the Dockerfile or Docker Compose file.

### 4. Connect from VS Code

* Open VS Code.
* Go to the **Remote Explorer** or use **Remote-SSH: Connect to Host...**.
* Use the SSH configuration pointing to `localhost` with the proper port (e.g., 2222).
* Once connected, you can develop directly inside the container environment.

## Customization

* Modify `docker-compose.yml` and `Dockerfile` to install additional tools or configure the environment as needed.
* Add persistent volumes to keep your data between container restarts.

## Troubleshooting

* If you get host key verification errors, remove the old key from `~/.ssh/known_hosts`.
* Ensure the SSH server inside the container is running and accessible.
* Check port mapping in the compose file.
