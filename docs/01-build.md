# Setup

```bash
$ git init
$ gibo dump Node VisualStudioCode >> .gitignore
$ yarn init -y
$ yarn add express
```

# Create, Build and Run

## Create sample server

```javascript
// ./src/index.js

const express = require("express");
const app = express();
const port = 5678;

app.get("/", (req, res) => res.send("Hello, World!"));

app.listen(port, () => console.log(`Example app listening on port ${port}`));
```

## Test server in local

```bash
$ node src/index.js

Example app listening on port 5678
```

http://localhost:5678/

## Create Dockerfile

```dockerfile
# ./Dockerfile

FROM node:12-alpine

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

EXPOSE 5678
CMD ["node", "src/index.js"]
```

## Build docker image

```bash
$ docker build -t study-dockerfile .
$ docker images

REPOSITORY                        TAG                 IMAGE ID            CREATED             SIZE
study-dockerfile                  latest              03363d05bce4        4 minutes ago       94.7MB
```

## Run server on docker image

```bash
$ docker run -it -p 5678:5678 study-dockerfile

Example app listening on port 5678
```

http://localhost:5678/

You can return from docker process with Ctrl-p + Ctrl-q key.

# Stop and Remove

## Stop docker container

```bash
$ docker ps 
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS                                                                         NAMES
6710135aa7d2        study-dockerfile        "docker-entrypoint.s…"   12 seconds ago      Up 11 seconds       0.0.0.0:5678->5678/tcp                                                        stoic_mendel

$ docker stop 6710135aa7d2
6710135aa7d2
```

Run the `$ docker ps` command again and make sure the container is not listed.

## Remove docker container

```bash
$ docker ps -a
CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS                       PORTS                                                                         NAMES
6710135aa7d2        study-dockerfile           "docker-entrypoint.s…"   3 minutes ago       Exited (137) 2 minutes ago                                                                                 stoic_mendel

$ docker rm 6710135aa7d2
6710135aa7d2
```

Run the `$ docker ps -a` command again and make sure the container is not listed.

## Remove docker image

```bash
$ docker images
REPOSITORY                        TAG                 IMAGE ID            CREATED             SIZE
study-dockerfile                  latest              03363d05bce4        About an hour ago   94.7MB

$ docker rmi study-dockerfile
Untagged: study-dockerfile:latest
Deleted: sha256:03363d05bce4f09c09814dbe84ef381e9a7f34c1e68bc06aef67801d6f8f2c5a
...
```
