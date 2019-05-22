# Backup and Restore
> **This Section will go over how to backup and restore the FVTT docker container and FVTT Folder.**

# Table of Contents
1. [Backup](#backup)
     - [Backing Up the Container](#backing-up-the-container)
     - [Backing Up the Folder](#backing-up-the-folder)
2. [Restore](#restore)
     - [Restoring the Container](#restoring-the-container)
     - [Restoring the Folder](#restoring-the-folder)

# Backup
     > Backing up the server should be performed prior to updates or module installation. This can be done two ways,
       * Backing up the docker container through export
       * Backing the FVTT Folder

## Backing Up the Container [Ref](https://bobcares.com/blog/docker-backup/)

1. *Optional* Stop the docker container
     > Commands:
       ```
       docker ps
       docker stop -t 30 <Container ID>
       ```

    > Example:
      ```
      docker ps
      docker stop -t 30 FVTT
      ```

2. Export the docker container
    > Commands:
      ```
      docker ps -a
      docker commit -p <container-ID> <backup-name>
     docker save -o <backup-name>.tar <backup-name>
     ```
   > Example:
     ```
     docker ps -a
     docker commit -p 679facd4ee38 FVTT_Back
     docker save -o FVTT_Back.tar FVTT_Back
     ```

3. *Optional*: Save the .tar offsite.
    - How you do this is up to you.

## Backing Up the Folder

1. Access the shell via directions found [here](https://github.com/mcjamesloon/FVTT_Docker/tree/master/administration.md)
     > Command:
       ```
       docker ps
       docker exec -it <Container name>
       ```

# Restore
     > Restoring should only be done in the event of data loss, or critical failure. Perform this with caution and pay attention to versioning.

## Restoring the container
1. Ensure the .tar file is in the current directory
     > Command:
       ```
       ls -l
       ```

2. Load the container
     > Command:
       ```
       docker load -i <backup-name>.tar
       ```

     > Example:
       ```
       docker load -i FVTT_Back.tar
       ```

3. Run the container
     > Command:
       ```
       docker run -p 30000:30000 -d --name FVTT <backup-name>.tar
       ```

     > Example:
       ```
       docker run -p 30000:30000 -d --name FVTT FVTT_Back
       ```
