#!/bin/bash
#
# Place This script in IT'S OWN DIRECTORY. This script will assist in downloading, creating, and running the docker container.
#     'mkdir FVTT'
#
# This script will file-spam the directory it is run from. Please consider the ramifications of this.
#
# Please respect the wishes of the source and **DO NOT PUBLISH** your compiled docker container on Docker Hub.
# Doing so will inadvertently publish the source code.
#
# > Please make sure the general script installation guide is followed at https://github.com/mcjamesloon/FVTT_Docker/tree/master/Scripts
#
# Color Start
RED='\033[0;31m'
BLUE='\033[0;33m'
NC='\033[0m'
#
# Begin SCRIPT
echo -e "${BLUE}--Loading Script!-- ${NC}"
## Begin global variables
#
# Description and Directions:
function WelcomeMessage ()
{
  echo ""
  echo "---Jamesloon Foundry Docker Container Installation Script for Linux---"
  echo "                        --Version 1.0.0--                             "
  echo ""
  echo -e "This script is to assist in deployment of modules in to the Foundry Virtual Tabletop Application.
    ${RED}This script has no warranties implied or otherwise. Use at your own risk.
    Press CTL-C to cancel script.${NC}"
  sleep 1
  echo ""
  echo "Please follow the directions located at https://github.com/mcjamesloon/FVTT_Docker/blob/master/docs/Installation.md"
  echo ""
  echo -e "${RED}Please ensure the script is in its own directory.${NC}"
  echo ""
  echo "This script will place the source files in this directory when run, so please use with caution."
  echo ""
  echo "Listing Files in current directory:"
  ls -l
  echo "" && sleep 1
  echo "Listing current directory path:" && pwd
  echo ""
  echo "If this is correct, please re-run the script with 'bash Installation.sh run'"
  exit
}
#
function administration ()
{
  sOptions=("1. Accessing the console" "2. Accessing the shell" "3. Restart the server" "4. Stop the server" "5. Start the server" "6. Quit")
  select opt in "${sOptions[@]}"
  do
    case $opt in
      "1. Accessing the console")
        echo "Accessing the console. NOTE: To exit try CTRL+P & CTRL+Q. Else CTRL-C will stop the server.
          Run option 5 to start the server after using CTRL-C.";
        docker ps
        read -p "Enter the name of the docker container to connect to:" dName
        docker attach $dName; exit;;
      "2. Accessing the shell")
        echo "Access the shell. To exit, type 'exit' on the command line or use the Docker detach sequence."
        docker ps
        read -p "Enter the name of the docker container to conenct to:" dName
        docker exec -it $dName /bin/bash; exit;;
      "3. Restart the server")
        docker ps
        read -p "Enter the name of the docker container to restart:" dName
        docker restart $dName; exit;;
      "4. Stop the server")
        docker ps
        read -p "Enter the name of the docker container to stop:" dName
        docker stop $dName; exit;;
      "5. Start the server")
        docker ps -a
        read -p "Enter the name of the docker container to start:" dName
        docker start $dName; exit;;
      "6. Quit")
        echo "Exiting"
        exit;;
      *)
        echo "Invalid option $REPLY";;
    esac
  done
}
#
function install ()
{
  # Build the container
  function iBuild ()
  {
    echo "Building Containter"
    docker build -t $iName .
    if docker images | grep "$iName"; then
      echo "Build successful!"
    else
      echo "Build Failed! Please check files and logs for more info. Also please report the problem."
      exit
    fi
    echo "Running the container:"
    echo -e "${BLUE}Please enter the external port to host the container on. Example: 30000${NC}"
    read iPort
    docker run -p $iPort:30000 -d --name $cName $iName
    if docker ps | grep "$cName"; then
      echo -e "You should be able to access it from a web browser. Example: '192.168.0.2:$iPort'"
      echo -e "For futher actions such as how to access the shell or console, please re-run this script with
        'bash Installation.sh administration'"; exit
    else
      echo -e "${RED}Container did not start as expected. Please report and troubleshoot manually.${NC}"; exit;
    fi
  }

  # Unzip the Source Code
  function iUnzip ()
  {
    echo "Unzipping Files. Install the 'unzip' package if error occurs. Or unzip the files manually."
    if unzip | grep -e 'UnZip [0-9]'; then
      echo "Package 'unzip' is installed. Continuing."
    else
      echo "Package 'unzip' is NOT installed. Please extract the file manually, and then run 'bash Installation.sh install iBuild'"
      exit
    fi
    unzip ./*.zip
    echo "Listing files:"
    ls -l
    echo -e "${BLUE}Do you wish to remove ALL .zip files from current directory?${NC}"
    echo "Listing .zip that would be removed:"
    ls -l | grep *.zip
    select yn in "Yes" "No"; do
      case $yn in
        Yes) echo -e "${RED}Removing files.${NC}" && rm ./*.zip ; break;;
        No) echo "Moving on." ; break;;
      esac
    done
    iBuild
  }
  # Get the Source Code
  function iSource ()
  {
    echo "Getting source code"
    echo -e "${BLUE}Please enter the full LINUX download URL from the Foundry Virtual Tabletop Patreon:${NC}"
    read pSource
    wget $pSource
    echo ""
    echo "Downloading Dockerfile from jamesloon/master"
    echo ""
    wget https://raw.githubusercontent.com/mcjamesloon/FVTT_Docker/master/Dockerfile
    iUnzip
  }
  function iStart ()
  {
    echo "Checking Pre-reqs"
    if docker --version | grep 'Docker version'; then
      echo Docker is installed
    else
      echo "Docker is not installed or user is not apart of Docker group. Please install Docker or add user to Docker group."; exit
    fi
    echo -e "${BLUE}Please enter a name for the Docker container:${NC}"
    read cName
    echo -e "You have entered ${RED}$cName${NC}."
    read -p "Please enter a name for the Docker image. Example: 'fvtt/test'" itName
    iName="${itName,,}"
    echo -e "Docker image name will be called: ${RED}$iName${NC}."
    iSource
  }
  #Entry Point
  if declare -f "$2" > /dev/null
  then
    # call arguments verbatim
    "$@"
  else
    # Show a helpful error
    echo "'$2' is not a known function name. Continuing.";
    iStart
  fi
  "$@"
}
#
#Run function
function run ()
{
  echo "---Jamesloon Foundry Docker Container Installation Script for Linux---"
  echo "                        --Version 1.0.0--                             "
  echo ""
  echo -e "This script is to assist in deployment of modules in to the Foundry Virtual Tabletop Application.
    ${RED}This script has no warranties implied or otherwise. Use at your own risk.
    Press CTL-C to cancel script.${NC}"
  echo "Continuing in 3" && sleep 1
  echo "2" && sleep 1
  echo "1" && sleep 1
  echo "Please select an option from below:"
sOptions=("1. Install" "2. Administration" "3. Quit")
  select opt in "${sOptions[@]}"
  do
    case $opt in
      "1. Install")
        echo "Entering Installation Mode:";
        install;;
      "2. Administration")
        echo "Entering Administration Mode:";
        administration;;
      "3. Quit")
        echo "Exiting program..."; exit
        ;;
      *) echo "Invalid Option $REPLY";;
    esac
  done
}

## 3-rd party code taken from https://stackoverflow.com/questions/8818119/how-can-i-run-a-function-from-a-script-in-command-line
# Check if the function exists (bash specific)
if declare -f "$1" > /dev/null
then
  # call arguments verbatim
  "$@"
else
  # Show a helpful error
  echo "'$1' is not a known function name. Running WelcomeMessage" >&2
  WelcomeMessage
fi
"$@"
