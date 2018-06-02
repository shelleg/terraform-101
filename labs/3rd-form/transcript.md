
asciinema rec -t "terraform - Using data sources"
export AWS_PROFILE=default
clear

######################
# Initialize terraform
######################
terraform init

################
# Plan terraform
################
terraform plan

#################
# Apply terraform
#################
terraform apply -auto-approve

###############
# using aws cli
###############
aws ec2 describe-instances --filters "Name=tag:Name,Values=xenail01" --region eu-west-1

#############################
# Destroy plan with terraform
#############################
terraform destroy
