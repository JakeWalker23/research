# Docker

Docker is containerisation software that uses operating system level use of virtualisation. Docker is an iteration on virtualisation from previous techniques to run virtual machines. Docker containers are much faster, require less resources and have greater flexibility that spinning a brand new VM up each time.


## Docker commands

```
docker run 
```


## Running a static site

Just using ``` docker run ``` will spin up the container; however there is no access to it. Using ``` -P``` to publish all ports, then it is accessible through a web browser. 

Using ```--name jakes-site``` We can give the container a user friendly name rather than a dockerID

Using ```-d``` allows to run the detached mode which means it runs in the background. 



## Building an Image 

A ```docker image``` is pre built container that automates container creation. An image contains all the commands to set up a container from scratch. It starts with a ```FROM``` command, sets up a ```WORKDIR``` and then ```RUN``` commands that the application will use. 

Docker hub has a registry of pre built containers that are maintained by open source contributors. If there is not an image to satisfy your needs, you can build your own image and publish it to the registry using the ```docker build``` command. Once the image is built, you can run ``` docker run -p {port} {username/application}```. This runs the container and exposes it through a port defined by the ```-p``` command.


## Docker Network

Most applications use multiple services that talk to eachother through a network. It is a good idea to containerise each service with its own set up. Using docker, you can still talk to each service container using ```docker network```. 

```docker network ls``` shows that docker ships with 3 containers as standard. The bridge network is shared for all containers. Creating your own network ``` docker network create {network}``` allows you to create a network that is isolated from other containers. You can use ```curl {ip:port}``` to see if the container is listening on that IP address.



## Docker Compose

Consider the following docker-compose.yml file: What are are doing is setting up multiple services and creating a docker network with one file. The files contains services, ports and volumes to persist data.

A docker-compose file combines images, networks and volumes to create a networked microservice instance. Docker is networking multiple containers and persisting data in a docker volume. Brilliant.

```
version: "3"
services:
  es:
    image: docker.elastic.co/elasticsearch/elasticsearch:6.3.2
    container_name: es
    environment:
      - discovery.type=single-node
    ports:
      - 9200:9200
    volumes:
      - esdata1:/usr/share/elasticsearch/data
  web:
    image: yourusername/foodtrucks-web
    command: python3 app.py
    depends_on:
      - es
    ports:
      - 5000:5000
    volumes:
      - ./flask-app:/opt/flask-app
volumes:
  esdata1:
    driver: local

```

## To run

```docker compose up -d```

Check network ```docker network ls```

Inspect network ```docker inspect network {network}```



https://docker-curriculum.com/#what-is-docker