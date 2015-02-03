!#/bin/bash
# This program will make the attempt to switch the git user accounts and set their appropriate ssh key

# Global Vars
curDir=pwd
# file separator
fs="/"


switchGitUser(){
# Git aliases to changeusers
gitProfile=$1

eval "$(ssh-agent -s)"
if [[ $gitProfile == "jpl" || $gitProfile == 'Jpl' || $gitProfile == "JPL"  ]]; then
	echo "Will use "$gitProfile
	`ssh-add /home/$USER/.ssh/work_id_rsa`
	git config --global user.email "Carlo.E.Sanchez@jpl.nasa.gov"
	git config -l
else
	echo "Will use "$gitProfile
	`ssh-add /home/$USER/.ssh/personal_id_rsa`
	git config --global user.email "carloesanchez@gmail.com"
	git config -l
fi


}

process(){
echo 
echo "Program attempts to switch the git ssh key profile and git user to user with that profile"
echo
echo "Please enter the name of the git profile you want to use."
echo "Current choices are 'jpl' or 'private'"
read gitProfileToUse

switchGitUser $gitProfileToUse

}

runScript(){
process
}

# if runScript is not called program won't run
runScript
