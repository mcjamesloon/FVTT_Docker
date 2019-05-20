# FVTT_Docker
Docker file and instructions for hosting Foundry Virtual Tabletop in a docker container.

# Installation Instructions
This guide will discuss how to host Foundry Virtual Tabletop on a docker container. The following was developed for Ubuntu 18.04.2 LTS; however, the basic steps should be the same across distributions.

### The following environment was used for testing this installation:
     - Ubuntu Server 18.04.2 LTS
     - Docker Version 18.09.02 
     - Foundry Virtual Tabletop Version Beta 0.2.9 & 0.2.10
## Basic Installation
> This guide assumes a basic understanding of Docker. Please ensure that Docker is installed and configured on the host. The process for doing this will vary from system to system.
> Information about Docker can be found on the official page [here](https://docs.docker.com/v17.12/get-started/#containers-and-virtual-machines).
1. Verify Docker installation 
     - `docker version`
2. Create a new directory to build the new container
     - `mkdir <Name for directory>`
     - Example: `mkdir FVTT`
3. Open the new directory
     - `cd <Name of directory>`
     - Example `cd FVTT`
4. Download the Foundry Tabletop Source for your distribution and unzip the files into the directory
     - `wget <Full Linux Download Link from the Foundry Patreon>`
     - `unip ./*.zip`
5. Download the Dockerfile found [here](https://github.com/mcjamesloon/FVTT_Docker/blob/master/Dockerfile)
     - `wget https://raw.githubusercontent.com/mcjamesloon/FVTT_Docker/master/Dockerfile`
6. Build the Docker Image
     - `docker build -t <Set unique image name> .`
     - Example: `docker build -t fvtt/node-web-app .`
     - NOTE: The `.` at the end is required!
7. Verify the Docker Image
     - `docker images`
8. Start the Docker container
     - `docker run -p <external port>:30000 -d --name <Name for container> <Image name set under step 6>`
     - Example: `docker run -p 30000:30000 -d --name FVTT fvtt/node-web-app`
9. Verify the Docker container is running
     - `docker ps`
     - This should show a container with the image name and container name you set previously.
10. If all went right you should be able to connect to it with `<IP address of host>:<External port set in Step 8>`
     - Example: 127.0.0.1:30000

# Accessing the node.js console:
To access the console, enter the following command:
     - `docker attach <Container name>`
     - Example: `docker attach FVTT`
To exit the container, perform the escape sequence: CTRL+p & CTRL+q
     - NOTE: In my testing over SSH, the escape sequence is broken. I have not found a solution that works as of 5/20/19.
     - Possible workaround is to open a new screen session prior to running the `docker attach` command.

# Accessing the Shell:
To access the shell of the docker container to perform tasks such as modify files or install modules, perform the following command:
     - `docker exec -it <Container name>`
     - Example: `docker exec -it FVTT`
     
## Adding Modules:
Adding Modules will vary depending on the module. By default, the modules need to be extracted to the `public/modules` directory. Please follow the module's instructions for other installation steps.
### Example Module Addition:
This will be an example of how to install the ddb-importer module located [here](https://github.com/sillvva/foundry-vtt-modules/tree/master/ddb-importer)
1. Access the shell of the container
     (UNFINISHED)
