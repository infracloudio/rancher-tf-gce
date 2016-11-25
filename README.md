# rancher-tf-gce
Scripts and terraform files to create a rancher cluster over Google Cloud

## Pre-requisites
* Google Cloud Platform Account
* ssh keypair 
* terminal which understands bash (Mac users can open regular command prompt), while Windows users need a bash emulator like [gitbash](https://git-scm.com/download/win) or [cygwin](https://cygwin.com/install.html) or [MobaXterm] (http://mobaxterm.mobatek.net/download.html)


## One time setup steps
* Clone this repo
* Go to Google Cloud Platform Console and create a new project
* Click "Enable and Manager Google APIs"
* Click Enable API
* In next screen, select "Google Compute Engine API"
* Click Enable (this will take a minute or two)
* Now click button shown below
* Select IAM and Admin
* Click Service Accounts on the left side pane
* Click Create Service Account
* Provide Name as "terraform" Role as Project owner, select "Furnish a new key" of type JSON as shown below
* Click Create, this will download a JSON file. 
* Copy this JSON file to credentials folder and rename it as terraform.json


