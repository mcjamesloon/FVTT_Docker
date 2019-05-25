# Installation Instructions
This guide will discuss how to host Foundry Virtual Tabletop on a docker container. The following was developed for Ubuntu 18.04.2 LTS; however, the basic steps should be the same across distributions using Docker-CLI.

# Table of Contents

1. [Manual Build](#command-installation)
     - [Building the Container](#building-the-container)
     - [Running the Container](#running-the-container)
     - [Container Administration](docs/Administration)
2. [Script Build](#script-installation)
     - [Script Installation](#script-installation)
     - [Script Functions](#script-functions)

```
# The following environment was used for testing this installation:
     - Ubuntu Server 18.04.2 LTS
     - Docker Version 18.09.02
     - Foundry Virtual Tabletop Version Beta 0.2.9 & 0.2.10
```

# Command Installation
> This guide assumes a basic understanding of Docker. Please ensure that Docker is installed and configured on the host. The process for doing this will vary from system to system.

> NOTE: Information about Docker can be found on the official page [here](https://docs.docker.com/v17.12/get-started/#containers-and-virtual-machines).

## Building the Container
1. Verify Docker installation
   > Command:
   ```
   docker version
   ```

2. Create a new directory to build the new container
   > Commands
   ```
   mkdir <name of directory>
   cd <name of directory
   ```

   > Example:
   ```
   mkdir FVTT
   cd FVTT
   ```

4. Download the Foundry Tabletop Source for your distribution and unzip the files into the directory
   > Commands:
   ```
   wget <Full Linux Download Link from the Foundry Patreon>
   unzip ./*.zip
   ```

5. Download the raw Dockerfile from [here](Dockerfile)
   > Command:
   ```
   wget https://raw.githubusercontent.com/mcjamesloon/FVTT_Docker/master/Dockerfile
   ```

6. Build the Docker Image
   > Command:
   ```
   docker build -t <Set unique image name> .
   ```

   > Example:
   ```
   docker build -t fvtt/node-web-app .
   ```

   > NOTE: The `.` at the end is required!

7. Verify the Docker Image
   > Command:
   ```
   docker images
   ```

## Running the Container
1. Start the Docker container
   > Command:
   ```
   docker run -p <external port>:30000 -d --name <Name for container> <Image name set under step 6>
   ```

   > Example:
   ```
   docker run -p 30000:30000 -d --name FVTT fvtt/node-web-app
   ```

2. Verify the Docker container is running
   > Command:
   ```
   docker ps
   ```

  > NOTE: This should show a container with the image name and container name you set previously.

3. If all went right you should be able to connect to it with `<IP address of host>:<External port set in Step 8>`
  > Example: http://192.168.x.x:30000

# Script Installation
- Block Install Code. Paste this into terminal for the fastest setup. Below is a breakdown of this code.
   ```
   mkdir FVTT && \
   cd FVTT && \
   wget https://github.com/mcjamesloon/FVTT_Docker/raw/master/Scripts/Installation.sh && \
   chmod +x Installation.sh && \
   bash Installation.sh run
   ```

1. Download the script onto the Linux Docker host.
   > NOTE: This was tested on Ubuntu 18.04.2 LTS

   > Command:
   ```
   mkdir FVTT && \
   cd FVTT && \
   wget https://github.com/mcjamesloon/FVTT_Docker/raw/master/Scripts/Installation.sh
   ```

2. Make the script executable:
   > Command:
   ```
   chmod +x Installation.sh
   ```

3. Run the script   
   > Command:
   ```
   bash Installation.sh run
   ```

## Script functions
> There are a number of functions this script can do.

1. Run Function
   ```
   bash Installation.sh run
   ```
   > This function runs the script and gives options. This is the safest place to start.

2. Install Function
   ```
   bash Installation.sh install
   ```
   > This function builds the Docker container.

3. Administration Function
   ```
   bash Installation.sh administration
   ```
   > This function brings up the administration selection screen
