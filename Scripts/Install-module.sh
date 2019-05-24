#!/bin/bash
#
# > DIRECTIONS FOR THIS SCRIPT CAN ALSO BE FOUND under https://github.com/mcjamesloon/FVTT_Docker/blob/master/docs/Modules.md
#
# > DOWNLOAD THIS SCRIPT via the container shell to the `public/modules folder` in the docker container.
## Directions for accessing the shell can be found at https://github.com/mcjamesloon/FVTT_Docker/blob/master/docs/Administration.md#accessing-the-shell
#
# > TO EXECUTE THIS SCRIPT you must first perform a sudo `chmod +x ./Install-module.sh` from the directory the script is installed
#
# > To use Text File Addition mode, place a text file with the RAW download URLs in it. One URL per line.
#
#
#Global Variables:
##Color Start
RED='\033[0;31m'
BLUE='\033[0;33m'
NC='\033[0m'
#
#Global Functions:
echo "Loading Script."
#
#Description and Directions:
function WelcomeMessage ()
{
  echo -e "${RED}This script is to assist in deployment of modules in to the Foundry Virtual Tabletop Application.
   This script has no warranties implied or otherwise. Use at your own risk.
   Press CTL-C to cancel script.${NC}"
  echo "Please ensure the general installation guide located at https://github.com/mcjamesloon/FVTT_Docker/blob/master/Scripts/README.md is followed"
  echo "  "
  echo "Script Specific instructions:"
  echo "1. Access the Docker container shell."
  echo "   - Directions for this can be found at https://github.com/mcjamesloon/FVTT_Docker/blob/master/docs/Administration.md#accessing-the-shell"
  ## This script must be downloaded to the `public/modules` directory in the Docker container.
  echo "2. Download or move this script into the 'public/modules' directory of the server"
  echo "   - Use 'wget <path to RAW download>' OR cp ./Install-module.sh /home/node/FVTT/public/modules/Install-module.sh"
  echo "3. Once this is done, run this script with 'bash Install-module.sh run'"
  echo "To use Text File Addition mode, create a file named 'urls.txt' with the RAW download URLs in the 'public/modules' folder with the script. One URL per line."
  sleep 5; exit;
}
#
#Begin Unzip Function
function fUnzip ()
{
  echo "Listing directory"
  ls -la
  echo "Extracting all .zip files"
  unzip -o ./*.zip
  echo "Listing directory"
  ls -la
  echo "Do you wish to clean up all .zip files from directory? If they are not removed, it will cause issues when this script is run again."
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) echo "Removing files." && rm ./*.zip
      No ) echo "Moving on. Please remove these files before running this script again."
    esac
  done
}
#
#Begin Single Addition mode
function singleAddition ()
{
  echo "Entered single addition mode"
  echo -e "${BLUE}Please paste in the URL of the RAW .zip module below:${NC}"
  read sURL
  echo -e "${RED}You have entered: $sURL.${NC}"
  sleep 2
  if [ $sURL == *"raw"* ]
    then
      echo "Downloading .zip file" && wget $sURL
      fUnzip
    else
      echo "RAW FILE NOT DETECTED. Please double check the URL and run the script again."
      exit
  fi
  echo "Addition compleate. Please restart the server and activate the module from within Foundryvtt."; exit
}
#
#Begin Text File Addition mode
function multiAddition ()
{
  echo "Entered multi module addition mode."
  echo "Checking for text file."
  lZip=ls
  if [ $lZip == *"urls.txt"*]
    then
      echo -e "Located text file. ${RED}Please note, this script will NOT validate these URLs for you. If any errors occur, please install manually or use the individual script.${NC}"
      echo "Downloading files"
      wget -i urls.txt
      echo "Donload compleate. Moving on."
      fUnzip
      echo "Multi-module installation compleate. Please restart the server and activate the module from within Foundryvtt."
      exit
}
# Begin Selection function
function selection ()
{
  echo -e "${BLUE}Please chose a mode from the list below:${NC}"
  echo "[1] Single addition mode:"
  echo "[2] Text file addition mode:"
  PS3='Please enter your choice: '
  sOptions=("1" "2" "Quit")
  select opt in "${sOptions[@]}"
  do
    case $opt in
      "1")
        echo "Entering single addition mode";
        singleAddition;;
      "2")
        echo "Entering text file addition mode:";
        multiAddition;;
      "Quit")
        echo "Exiting program..."; break
        ;;
      *) echo "invalid option $REPLY";;
    esac
  done
}
#
#Begin Script Functions
function run ()
{
  echo -e "Welcome to Jamesloon's module installer script for Foundry Virtual Tabletop.
    ${RED}Please note that this script has no warranties implied or otherwise and is provided on 'as is' basis. Use at your own risk.
    You may press CTRL-C to cancel script.${NC}"; sleep 2;
  echo "#";
  echo "#";
  #Validate working directory to prevent accidents.
  echo "Checking directory.";
  wrkdir=pwd
  if [[ $wrkdir == *"public/modules" ]]; then
    echo "Directory Verified. Moving on." && selection;
    else
      echo "Directory Could not be validated for this script.
        This could be in error; however there is no harm in double checking that the script is being executed from the 'public/modules' directory."
      echo "If you have done this and beleive this is as error, proceed with extreem caution. If you are certain, run the script with the command 'bash Install-module.sh selection'"
      sleep 5
      exit;
  fi
}
#
## 3-rd party code taken from https://stackoverflow.com/questions/8818119/how-can-i-run-a-function-from-a-script-in-command-line
# Check if the function exists (bash specific)
if declare -f "$1" > /dev/null
then
  # call arguments verbatim
  "$@"
else
  # Show a helpful error
  echo "'$1' is not a known function name" >&2
  exit 1
fi
"$@"

WelcomeMessage
