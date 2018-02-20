DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/../helpers/demo-magic.sh"
source "$DIR/../helpers/test-azure-cred.sh"

DEMO_PROMPT="${GREEN}\u@Azure:${BLUE}\W$ "

pe "ansible-playbook $DIR/../playbooks/VMCreateSSH.yml"
wait
p ""
p ""
p "# Time to clean up."
pe "az group delete -n ansible-demo --no-wait"


