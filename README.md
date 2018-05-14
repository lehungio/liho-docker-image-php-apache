# liho-docker-image-php-apache
- This repository contains a Dockerfile to build a PHP Docker Image with CentOS Base.

[![Build Status](https://travis-ci.org/lehungio/liho-docker-image-php-apache.svg?branch=master)](https://travis-ci.org/lehungio/docker-centos)

## Base Docker Image

* [centos/latest](https://registry.hub.docker.com/_/centos/)

## Usage

### Installation

1. Install [Docker](https://www.docker.com/).

2. You can download automated build from public Docker Hub Registry:

```
docker pull lehungio/php-apache:latest
```

**Another way: build from Github**

To create the image lehungio/centos, clone this repository and execute the following command on the docker-centos folder:

`docker build -t lehungio/php-apache:latest .`

Another alternatively, you can build an image directly from Github:

`docker build -t="lehungio/php-apache:latest" github.com/lehungio/liho-docker-image-php-apache`


### Create and running a container

**Create container:**

```
docker create -it --name php -h php lehungio/php-apache
```

**Start container:**

```
docker start liho-docker-image-php-apache
```


### Connection methods:

```
docker exec -it liho-docker-image-php-apache bash
```


### Upgrading

Stop the currently running image:

```
docker stop liho-docker-image-php-apache
```


Update the docker image:

```
docker pull lehungio/php-apache:latest
```
