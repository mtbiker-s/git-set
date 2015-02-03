!#/bin/bash
# This program will make the attempt to switch the git user accounts and set their appropriate ssh key

# Global Vars
curDir=pwd
# file separator
fs="/"

## Make Changes here
## Start
# Creating the variable for choices
# These should be changed accordingly to your preference
work="work"
workEmail="your_work_email_address"
workIdRsaFile="/path/to/your/work/.ssh/id_rsa_file"
# E.g --  workIdRsaFile="/Users/$USER/.ssh/id_work_rsa"

private="private"
privateEmail="your_personal_email_address"
privateIdRsaFile="/path/to/your/private/.ssh/id_rsa_file"
# E.g. -- privateIdRsaFile="/Users/$USER/.ssh/id_private_rsa"
## End

##
# Function to switch the git user
# Takes 1 parameter
##
switchGitUser(){
# Git aliases to changeusers
gitProfile=$1

eval "$(ssh-agent -s)"
if [[ $gitProfile == $work ]]; then
	echo "Will use "$gitProfile
	`ssh-add $workIdRsaFile`
	git config --global user.email "$workEmail"
	
else
	echo "Will use "$gitProfile
	`ssh-add $privateIdRsaFile`
	git config --global user.email "$privateEmail"
	
fi

echo
echo "Current git configuration:"
git config -l


}

##
# Function that will process everything
##
process(){
echo 
echo "Program attempts to switch the git ssh key profile and git user to user with that profile"
echo
echo "Please enter the name of the git profile you want to use."
echo "Current choices are '$work' or '$private'"
read gitProfileToUse

## Call to switchGitUser function
switchGitUser $gitProfileToUse

}


##
# Function that calls the process. If this function is not called
# the program won't run
##
runScript(){
process
}

# Calling function runScript so program will run
runScript
