day2.md

## 1. Core Terraform Configuration
1a — Create the Top-Level Terraform Config Files
1b — Wire envs/dev/main.tf to use the root configuration
1c — Test the new config


## 2. Build the Network Module (Your First Real Infra Component)

This is where your repo becomes capable of deploying actual cloud infrastructure.
We start with networking because:

- Every platform depends on VPC
- Required for GKE/EKS
- Required for NAT, firewalls, subnets
- Interviewers almost always ask VPC questions
- It is the foundation for future modules

Think of networking as the basement foundation of your cloud platform.

#### A. Auto-generate your modules/network boilerplate
	- modules/network/main.tf
	...
	- modules/network/variables.tf
	...
	- modules/network/outputs.tf
	...
#### B. Wire the module into envs/dev/main.tf

#### C. Test the module


## 3 — Provision the Resources (Apply)

step 1: What will terraform apply do?

A. It will:
- Create a VPC
- Create 2 subnets
- Use your actual GCP project
- Write IDs into the terraform state

B. It will NOT:
- create public IPs
- create VM instances
- incur major cost
- create NAT gateways (yet)
- create a cluster (that’s later)

VPC + subnets cost $0.  So it’s 100% safe to apply.



step 2: Before You Apply — Safety Checklist 
...


step 3: Apply the Network Infrastructure
```
terraform apply -auto-approve           #This will take ~10–20 seconds.
````




step 4: Add NAT + Firewall + Routes



step 5: Build the GKE Module





## Troubleshootings and CLI gcloud commands
### Terraform - Test the new config
terraform init
terraform validate

terraform plan
terraform apply



### Gcloud CLI commands
gcloud auth login
gcloud auth application-default login   #authentication with Application Default Credentials (ADC) is working ???

gcloud auth list


gcloud config get-value project
gcloud config set project gke-iac-lab-xuan-c25a

gcloud storage buckets list


gcloud auth application-default print-access-token
gcloud projects describe gke-iac-lab-xuan-c25a




