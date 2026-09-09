# appointment-saas

## Instructions

### 1. Prerequisites

#### Software

Make sure the following are installed on your host machine:

```bash
docker --version
docker compose version
node -v
npm -v
```

If not yet installed, you can run these commands:

MacOS:

```bash
brew install --cask docker # also includes docker compose
brew install node # also includes npm
```

Linux (Fedora):

```bash
# Remove old versions if present
sudo dnf remove docker docker-client docker-client-latest docker-common \
  docker-latest docker-latest-logrotate docker-logrotate docker-engine

# Add Docker official repository
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Install Docker Engine + Compose plugin
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start Docker
sudo systemctl enable --now docker

# Add user to docker group (create group if not present)
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker   # or log out and back in
```

#### Environment variables

Make sure as well you have your own `.env` file to store all the environment variables needed for this program. You can find the variables needed for this project in the root of this repository under `.env.example`

Feel free to choose the values as for now, everyone will have their own local environment variables. The default port for the database is 5432 so you can keep that the same, otherwise you have to update the docker compose file.

### 2. Starting the Project

From the project root, run:

```bash
make
```

This builds and starts the Docker containers using the project's Docker Compose configuration.

To only start the containers:

```bash
make up
```

## 3. Stopping the Project

To stop and remove the containers:

```bash
make down
```

To stop containers and prune unused Docker images/system data:

```bash
make clean
```

To stop and remove the containers, but also remove the named volumes

```bash
make fclean
```

For a full teardown followed by a full rebuild:

```bash
make re
```

To check if everything is running correctly:

```bash
docker images # Should show 3 images corresponding to our services
docker ps # Should show 3 containers currently running
```

On the browser:

```text
http://localhost:3001
```

This should show "Hello World!" which means that the backend is running correctly.

```text
http://localhost:3000
```

This should show the default page created by Vite which means that the frontend is running correctly.

### The database container

To enter the container, you can run the following command using `psql` and change the username and database_name to the appropriate values set by the environment variables:

```bash
docker compose -f srcs/docker-compose.yml exec postgres psql -U <username> -d <database_name>
```

When inside, you can run the following example commands:

```bash
\l # List all databases
\du # List all roles/users
\dn # List schemas
\h # Show help for SQL commands
\q # Quit psql and return to your normal terminal
```
