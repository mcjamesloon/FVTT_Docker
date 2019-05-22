# Administration
## Accessing the node.js console:
* To access the console, enter the following command:
     * `docker attach <Container name>`
     * Example: `docker attach FVTT`
* To exit the container, perform the escape sequence: CTRL+p & CTRL+q
     * NOTE: In my testing over SSH, the escape sequence is broken. I have not found a solution that works as of 5/20/19.
     * Possible workaround is to open a new screen session prior to running the `docker attach` command.

## Accessing the Shell:
* To access the shell of the docker container to perform tasks such as modify files or install modules, perform the following command:
     - `docker exec -it <Container name>`
     - Example: `docker exec -it FVTT`
