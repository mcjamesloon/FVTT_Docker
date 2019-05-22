### Adding Modules:
> Adding Modules will vary depending on the module. By default, the modules need to be extracted to the `public/modules` directory. Please follow the module's instructions for other installation steps.

#### Example Module Addition:
This will be an example of how to install the ddb-importer module located [here](https://github.com/sillvva/foundry-vtt-modules/tree/master/ddb-importer)
1. Access the shell of the container
     - See `Accessing the Shell` above
2. Change directory to /public/modules
     - `cd public/modules`
3. Download the .zip file from github and extract the folder within
     > Note: Copy the Download Link or Raw Files. Again follow the directions for the module.

     - `wget <URL to .zip file>`
     - Example: `wget https://github.com/sillvva/foundry-vtt-modules/raw/master/ddb-importer/ddb-importer.zip`
     - `unzip -o ./*.zip`
     > *Note: If you receive an error that goes: `unzip: cannot find zipfile directory in one of...` Please paste the URL into a web browser and make sure it does not direct to the github overview page. You must have the direct download link.*

     - `ls -la`
     > Note: It may be wise to clean up the .zip files now to make future updates easier.

     - Do this with `rm ./*.zip`
4. Restart the docker container
     - Exit the container using the docker escape sequence *(Default is CTRL+p & CTRL+q)*
     - `docker restart <Container Name>`
     - Example: `docker restart FVTT`
5. From within the /game as the GM, go to `Settings > Manage Modules`
6. Select the check boxes to make the applicable modules active.
