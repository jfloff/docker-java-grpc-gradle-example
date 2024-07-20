# Docker + Java + gRPC + Gradle Example Application

This repository contains an example application that demonstrates the use of gRPC with Java and Gradle, deployed using Docker. Follow the steps below to build and run the client and server components.

## Prerequisites

- Docker
- Docker Compose
- Gradle

## Steps to Build and Run the Application

### 1. Build the Development Docker Image

First, build the Docker image for development:

```sh
docker build -t docker-java-grpc-gradle:dev .
```

### 2. Build the JAR Files

Next, build the JAR files for both the client and the server.

#### Build the Client JAR

```sh
docker run --rm -v $(pwd)/client:/home -w /home docker-java-grpc-gradle:dev gradle clean shadowJar
```

#### Build the Server JAR

```sh
docker run --rm -v $(pwd)/server:/home -w /home docker-java-grpc-gradle:dev gradle clean shadowJar
```

### 3. Create Docker Network

Create a Docker network to enable communication between the client and server:

```sh
docker network create -d bridge hello_network
```

### 4. Launch the Server

Finally, use Docker Compose to launch the server:

```sh
docker compose up -d server
```

## Additional Information

- The Docker image `docker-java-grpc-gradle:dev` is used for building the JAR files.
- The `hello_network` Docker network is required for the client and server to communicate.
- The `docker-compose.yml` file should be configured properly to define the services and network.

Feel free to contribute to this project by submitting issues or pull requests.