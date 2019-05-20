# FVTT_Docker
Docker file and instructions for hosting Foundry Virtual Tabletop in a docker container.

# Installation Instructions
This guide will discuss how to host Foundry Virtual Tabletop on a docker container. This will be a generic guide that should be applicable to most hosts; however, the example steps below are for using docker on a Ubuntu 18.04.2 LTS host.

### The following environment was used for testing this installation:
  Ubuntu Server 18.04.2 LTS
  Docker Version 18.09.02 
  Foundry Virtual Tabletop Version Beta 0.2.9 & 0.2.10
## Basic Instalation
> This guide assumes a basic understanding of Docker. Please ensure that docker is installed and configured on the host. The process for doing this will vary from system to system.
> Information about docker can be found on the official page [here](https://docs.docker.com/v17.12/get-started/#containers-and-virtual-machines).
1. Verify docker is installed with `docker version`
2. Make a directory to compile the new container
     - `mkdir <Name for directory>`
     - Example: `mkdir FVTT`
3. Open the new directory
     - `cd <Name of directory>`
     - Example `cd FVTT`
4. Download the Foundry Tabletop Source for your distribution and unzip the files into the directory
     - `wget <Full Download Link from Foundry Patreon post>`
     - `unip ./*.zip`
5. Download the Dockerfile found [here](https://github.com/mcjamesloon/FVTT_Docker/blob/master/Dockerfile)
     - `wget https://raw.githubusercontent.com/mcjamesloon/FVTT_Docker/master/Dockerfile`
6. Build the Docker Image
     - `docker build -t <Set unique image name>`
     - Example: `docker build -t fvtt/node-web-app`
7. Verify the Docker Image
     - `docker images`
8. Start the Docker container
     - `docker run -p <external port>:30000 -d --name <Name for container> <Image name set under step 6>`
     - Example: `docker run -p 30000:30000 -d --name FVTT fvtt/node-web-app`
