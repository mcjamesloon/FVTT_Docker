# Administration
## Table of Contents:
1. [Administration](docs/Administration.md)
   - [Stopping the Container](#stopping-the-container)
   - [Starting the Container](#starting-the-container)
   - [Accessing the Console](#accessing-the-console)
   - [Accessing the Shell](#accessing-the-shell)
2. [Scripts](Scripts/README.md)

## Stopping the Container
To stop the container, perform the following:
> NOTE: This method could lead to data-loss. Please make sure any active worlds are paused and all players have exited.

   > Commands:
   ```
   docker ps
   docker stop -t 30 <Container-Name or ID>
   ```
   > Example:
   ```
   docker ps
   docker stop -t 30 FVTT
   ```

## Starting the Container
To start the container after host reboot or stopping the container, perform the following:

   > Commands:
   ```
   docker ps -a
   docker start <Container-Name or ID>
   ```

   > Example:
   ```
   docker ps -a
   docker start FVTT
   ```

## Accessing the console
To access the console, enter the following command:
   > Command:
   ```
   docker attach <Container name>
   ```
   > Example:
   ```
   docker attach FVTT
   ```

To exit the container, perform the escape sequence: CTRL+p & CTRL+q
     > NOTE: In my testing over SSH, the escape sequence is broken. I have not found a solution that works as of 5/20/19.

     > Possible workaround is to open a new screen session prior to running the `docker attach` command.

## Accessing the Shell
To access the shell of the docker container to perform tasks such as modify files or install modules, perform the following command:
   > Command:
   ```
   docker exec -it <Container name> /bin/bash
   ```

   > Example:
   ```
   docker exec -it FVTT /bin/bash
   ```
