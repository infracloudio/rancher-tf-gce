# rancher-tf-gce
Scripts and terraform files to create a rancher cluster over Google Cloud.
This will create a rancher kubernetes cluster with 1 master and 3 workers.


## Pre-requisites
* Google Cloud Platform Account
* ssh keypair 
* terminal which understands bash (Mac users can open regular command prompt), while Windows users need a bash emulator like [gitbash](https://git-scm.com/download/win) or [cygwin](https://cygwin.com/install.html) or [MobaXterm] (http://mobaxterm.mobatek.net/download.html)


## One time setup steps
* Clone this repo
* Go to Google Cloud Platform Console and create a new project ![alt text][step1]
* Click "Enable and Manage Google APIs" ![alt text][step2]
* Click Enable API ![alt text][step3]
* In next screen, select "Google Compute Engine API" ![alt text][step4]
* Click Enable (this will take a minute or two)
* Now click button shown below ![alt text][step5]
* Select IAM and Admin ![alt text][step6]
* Click Service Accounts on the left side pane 
* Click Create Service Account ![alt text][step7]
* Provide Name as "terraform" Role as Project owner, select "Furnish a new key" of type JSON as shown below ![alt text][step8]
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
#
# If you want to change number of nodes, then uncomment below line and set required value
#node_count = 4
#
# The default project name for the rancher project is k8srancher
# If you want to overwrite that name, uncomment below line and set required value
#rs_proj_name = "YOUR_CHOSEN_PROJECT_NAME"
~~~

## Steps to create rancher cluster
* Run `terraform apply` This will do following steps:
  1. Create one compute instance as master and start rancher server on it 
  2. Once master instance is created, script waits for the rancher server to boot up.
  3. API are triggered to create a rancher environment called "k8srancher" (or your chosen project name if you choose to overwrite it in terraform.tfvars), and rancher server is activated as first host of the cluster.
  4. Remaining compute instances are created and joined to the cluster.
  5. At the end you will get the IP of the rancher master, you can now go to http://RANCHER_MASTER_IP:8080 and work on your rancher cluster.

### Steps to destroy the cluster 

* Run `terraform destroy`. There will be a prompt from terraform for confirmation, type `yes` and all resources will be destroyed.


[step1]: https://github.com/harshal-shah/github-images/blob/master/rancher-tf-gce/CreateProject.jpg "Create GCP project"
[step2]: https://github.com/harshal-shah/github-images/blob/master/rancher-tf-gce/GoogleManageAPI1.jpg "Enable API"
[step4]: https://github.com/harshal-shah/github-images/blob/master/rancher-tf-gce/GoogleComputeEngineAPI.jpg "Search Compute Engine API"
[step3]: https://github.com/harshal-shah/github-images/blob/master/rancher-tf-gce/GCE-API-Enabled.jpg "Enable Compute Engine API"
[step5]: https://github.com/harshal-shah/github-images/blob/master/rancher-tf-gce/Prod-Serv.jpg "Products and Services"
[step6]: https://github.com/harshal-shah/github-images/blob/master/rancher-tf-gce/IAM-Admin.jpg "Service Account"
[step7]: https://github.com/harshal-shah/github-images/blob/master/rancher-tf-gce/CreateServAcc.jpg "Service Account"
[step8]: https://github.com/harshal-shah/github-images/blob/master/rancher-tf-gce/ServiceKey.jpg "Service Key"
