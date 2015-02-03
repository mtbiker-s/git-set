# git-set
A bash script that helps with switching your ssh git profile from your enterprise to personal and vice versa. Very helpful if you use git cli.

## First Steps
In order for these script to work you'll need to setup your ssh keys.
You can do this by following the steps in the GitHub help for "[Generating SSH keys](https://help.github.com/articles/generating-ssh-keys/)".

Rember to create one rsa file for work aka enterprise and one for private aka personal. 

## Configuring the script
Change the variables in the section that reads **Make Changes Here**.


```
## Make Changes Here
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
```
## Run and Test
Make sure all of the changes you've made are working accordingly. You can run with "./gitset.sh" 

It will prompt you to enter what ssh profile you want to use then it will promt your for your ssh passcode.

## Using the script
Run with ./gitset.sh when ever you need to change your GitHub ssh profile or create an alias in your .profile or .bashrc

E.g. alias gitset='bash /path/to/your/gitset.sh' 