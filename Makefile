dev-apply:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./env-dev/state.tfvars
	terraform apply -auto-approve -var-file=env-dev/main.tfvars

prod-apply:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./env-prod/state.tfvars
	terraform apply -auto-approve -var-file=./env-prod/main.tfvars

destroy-dev:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./env-prod/state.tfvars
	terraform destroy -auto-appprove -var-file=env-dev/main.tfvars

destroy-prod:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./env-prod/state.tfvars
	terraform destroy -auto-appprove -var-file=env-prod/main.tfvars