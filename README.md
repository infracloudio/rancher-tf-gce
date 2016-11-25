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
* Copy your public and private keys to the credentials folder as well.
* cd to the repo folder and create a file called terraform.tfvars with below content 
~~~
region = "us-central1"
region_zone = "us-central1-a"
project = "YOUR_PROJECT_NAME"
image = "ubuntu-os-cloud/ubuntu-1404-trusty-v20161020"
credentials_file_path = "credentials/terraform.json"
public_key_path = "credentials/YOUR_PUBIC_KEY_FILE.txt"
private_key_path = "credentials/YOUR_PRIVATE_KEY.ppk"
~~~

## Steps to create rancher cluster
* cd to scripts folder and run `runme.sh all` This will do following steps:
  1. Create one compute instance as master and start rancher server on it 
  2. Once master instance is created, script waits 50 seconds for the rancher server to boot up. 
  3. API are triggered to create a rancher environment called "k8sapitest", and rancher server is activated as first host of the cluster. 
  4. Terraform is called again to create remaining compute instances and join them to the cluster. 

### Steps to destroy the cluster 

* cd to scripts folder and run `runme.sh del`. There will be a prompt from terraform for confirmation, type `yes` and all resources will be destroyed.

### Troubleshooting 

To enable easy troubleshooting, the script can be called with step parameters also. 
* `runme.sh 1` will run step _i_ mentioned above
* `runme.sh 2` will run Steps _ii_ and _iii_ mentioned above
* `runme.sh 5` will run step _iv_ mentioned above
