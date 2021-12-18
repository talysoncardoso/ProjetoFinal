#!/bin/bash

VERSAO=$(git describe --tags $(git rev-list --tags --max-count=1))

cd terraform
RESOURCE_ID=$(terraform output | grep resource_id | awk '{print $2;exit}' | sed -e "s/\",//g")

cd ../terraform_ami
terraform init
export TF_VAR_versao=$VERSAO
export TF_VAR_resource_id=$RESOURCE_ID
terraform apply --auto-approve