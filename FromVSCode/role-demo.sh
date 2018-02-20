# Run from Docker or WSL console on Windows

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/../helpers/demo-magic.sh"
source "$DIR/../helpers/test-azure-cred.sh"

DEMO_PROMPT="${GREEN}\u@LoECDA:${BLUE}\W$ "

p "# Living on the edge with the Azure Preview Modules."
pe "ansible-galaxy install Azure.azure_preview_modules"
pe "pip install --user -r ~/.ansible/roles/Azure.azure_preview_modules/files/requirements-azure.txt > /dev/null"
pe "pip install --user docker-py > /dev/null"
p ""
p ""
p "# Logging in to Azure..."
az login --service-principal -u $AZURE_SERVICE_ACCOUNT_ID -p $AZURE_SERVICE_ACCOUNT_SECRET --tenant $AZURE_TENANT_ID > /dev/null
p "* Logged in."
p ""
p ""
p "# Creating a resource group to work in."
pe "az group create --resource-group sjm-demo --location eastus"
p ""
p ""
# p "# And stand up a multiple component infrastructure..."
# pe "ansible-playbook $DIR/../playbooks/role.yml"
# p ""
# p ""
# wait
# p "# Time to clean up."
# pe "az group delete --name sjm-demo --no-wait"
