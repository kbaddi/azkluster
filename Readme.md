#K8s Setup on Azure

Tools:
Terraform: To provision infrastructure.
Dockerfile: To setup Azure CLI container and install terraform
docker-compose: To start docker container with environment variables and Terraform config directory as a Volume.

## Azure Setup

Create Azure Service Principal with contributor Role to run Terraform.
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<Azure_Subscription_ID>"

Export Azure Service Principal credentials

export ARM_CLIENT_ID=<Azure_CLIENT_ID>
export ARM_CLIENT_SECRET=<Azure_CLIENT_SECRET>
export ARM_SUBSCRIPTION_ID=<Azure_Subscription_ID>
export ARM_TENANT_ID=<Azure_Tenant_ID>

Run docker-compose up after exporting the above environment values.

Known issue : docker-compose is stuck at Attaching to <container>. Ctrl+C and then start docker container

`docker start <container-name>`

then use docker exec to connect to the container
`docker exec -it <container-name> sh`

## Running Terraform

Once you attach to the container, cd into Terraform folder
`cd Terraform`

export TF_VAR_client_id=${ARM_CLIENT_ID}
export TF_VAR_client_secret=${ARM_CLIENT_SECRET}
export TF_subscription_id={ARM_SUBSCRIPTION_ID}

Initialize Terraform
`terraform init`

Run Terraform plan
`terraform plan`

Apply the configuration
`terraform apply -auto-approve`


echo "$(terraform output kube_config)" > ../<clustername>-config

This will copy the config to a file called azurek8s

On your host machine

cd to the project folder (ex: baks) and
`export KUBECONFIG=./<clustername>-config
