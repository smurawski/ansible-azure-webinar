DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/../helpers/demo-magic.sh"
source "$DIR/../helpers/test-azure-cred.sh"

DEMO_PROMPT="${GREEN}\u@Azure:${BLUE}\W$ "

## Run in cloud shell or auth with az cli first
p "# Let's set up our test environment."
pe "az group create --resource-group ansible-n-azure --location eastus"
p "az vm create --resource-group ansible-n-azure --name ansible-test-vm1 --image UbuntuLTS --generate-ssh-keys > /dev/null"
p "# And we'll create one machine with a tag."
p "az vm create --resource-group ansible-n-azure --name ansible-test-vm2 --image UbuntuLTS --tags nginx --generate-ssh-keys > /dev/null"
p ""
p ""
p "# Ansible allows us to use custom inventory scripts."
wait
pe "wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/azure_rm.py"
pe "chmod +x azure_rm.py"
p ""
p ""
p "# Ansible can use a resource group to target the VMs inside."
wait
pe "ansible -i azure_rm.py ansible-n-azure -m ping"
p ""
p ""
p "# Tags allow us to target specific resources without having to specify each of them."
pe "export AZURE_TAGS=nginx"
p "# We can still target the resource group, "
p "# but we'll only affect resources with a matching tag."
pe "ansible -i azure_rm.py ansible-n-azure -m ping"
wait
pe "ansible-playbook -i azure_rm.py $DIR/../playbooks/nginx.yml"
p ""
p ""
wait
p "# Time to clean up."
pe "az group delete -n ansible-n-azure --no-wait"
