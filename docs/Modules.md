# Table of Contents
1. Adding Modules:
   - [Manually Add Modules](#manual-module-addition)
   - [Scripted Module Addition](#scripted-module-addition)

# Adding Modules:
> Adding Modules will vary depending on the module. By default, the modules need to be extracted to the `public/modules` directory. Please follow the module's instructions for other installation steps.

## Manual Module Addition:
> Note: This guide will use the example of how to install the ddb-importer module located [here](https://github.com/sillvva/foundry-vtt-modules/tree/master/ddb-importer) All rights are reserved for their respective owners.

1. Access the shell of the container
   > See [Accessing the shell](docs/Administration#accessing-the-shell)
   ```
   docker exec -it <Container Name> /bin/bash
   ```

2. Change directory to /public/modules
   > Command
   ```
   cd public/modules
   ```

3. Download the .zip file from github and extract the folder within
   > NOTE: Copy the Download Link or Raw Files. Follow the specific directions for the module!

   > Commands:
   ```
   wget <URL to RAW .zip file>
   unzip -o ./*.zip
   ls -la
   ```

   > Example:
   ```
   wget https://github.com/sillvva/foundry-vtt-modules/raw/master/ddb-importer/ddb-importer.zip
   unzip -o ./*.zip
   ls -la
   ```
   > *NOTE:* If you receive an error that goes: `unzip: cannot find zipfile directory in one of...` Please paste the URL into a web browser and make sure it does not direct to the github overview page. You must have the **RAW** download link.

4. Clean up the zip files
   > Note: This step is optional; however, it may prevent problems installing modules later down the road.

   > Command:
   ```
   rm ./*.zip
   ```

4. Restart the docker container
   > Exit the container using the docker escape sequence. *(Default is CTRL+p & CTRL+q)*
   ```
   docker restart <Container Name>
   ```

   > Example:
   ```
   docker restart FVTT
   ```

5. From within the <ipaddress>/game as the GM, go to `Settings > Manage Modules`

6. Select the check boxes to make the applicable modules active.

## Scripted Module addition
> *NOTE:* As with any script downloaded from the internet, please verify the contents of the script prior to running.

1. Access the shell of the container
   > See [Accessing the shell](Administration#accessing-the-shell)
   ```
   docker exec -it <Container Name> /bin/bash
   ```

2. Change directory to public/modules
   > Command:
   ```
   cd public/modules
   ```

3. Download the script located [here](https://raw.githubusercontent.com/mcjamesloon/FVTT_Docker/master/Scripts/Install-module.sh)
   > Command:
   ```
   wget https://raw.githubusercontent.com/mcjamesloon/FVTT_Docker/master/Scripts/Install-module.sh
   ```

4. *Optional*: To add multiple modules at once, create a text file named `urls.txt` within the public/modules directory. Then, enter the RAW download URLs for the zip files with one per line.
   > Example Commands:
   ```
   cd public/modules
   nano urls.txt
   ```

   > Example Text File (Check out these amazing works!):
   ```
   https://github.com/sillvva/foundry-vtt-modules/raw/master/ddb-importer/ddb-importer.zip
   https://gitlab.com/moerills-fvtt-modules/journal-enhancer/raw/master/journal-enhancer.zip
   https://github.com/syl3r86/BetterNPCSheet5e/raw/master/betternpcsheet5e.zip
   ```

5. Execute the script
   > Commands:
   ```
   chmod +x ./Install-module.sh
   ./Install-module.sh
   ```

6. Follow the prompts in the script.
