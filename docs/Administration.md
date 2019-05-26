# Administration
## Table of Contents:
1. [Administration](Administration.md)
   - [Accessing the Console](#accessing-the-console)
   - [Accessing the Shell](#accessing-the-shell)
   - [Stopping the Container](#stopping-the-container)
   - [Starting the Container](#starting-the-container)
2. [Scripted Administration](#script-administration)

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

# Script Administration
These steps are to be performed on the Docker host system.

1. Download the file [here](/master/Scripts/Installation.sh)
   > Command:
   ```
   wget https://github.com/mcjamesloon/FVTT_Docker/raw/master/Scripts/Install-module.sh
   ```

2. Make the script executable.
   > Command:
   ```
   chmod +x Installation.sh
   ```

3. Run the `administration` function
   > Command:
   ```
   bash Installation.sh administration
   ```

4. Follow the prompts in the script
