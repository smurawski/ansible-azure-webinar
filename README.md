# Demo Scripts for the Ansible and Azure Webinar

## The Demo

### From the Cloud Shell

* `mkdir ~/source && cd ~/source`
* `git clone https://github.com/smurawski/ansible-azure-webinar`
* `./ansible-azure-webinar/FromCloudShell/dynamic-inventory-and-tags.sh -n`
* `./ansible-azure-webinar/FromCloudShell/run-a-playbook.sh -n`

### From VS Code

* `./ansible-azure-webinar/FromVSCode/role-demo.sh -n` to set up the resource group
* edit `./playbooks/role.yml` in VS Code
* run playbook with right-click "Run Ansible Playbook In Docker"


## Setting Up

### Common

#### Azure Service Principal

We'll need a service principal to allow Ansible to interact directly with the Azure APIs. [Here's a walk-through on creating the service principal.](https://cda.ms/bx)

### Setting Up CloudShell

#### Demo-Magic

The demo scripts use [`demo-magic`](https://github.com/paxtonhare/demo-magic) to walk through the steps.

`demo-magic` requires `pv`, which we don't have in the Cloud Shell.  We don't have root either, but we can either use a static binary or compile from source.

##### Binary

```shell
cd /tmp
wget http://mirrors.kernel.org/ubuntu/pool/universe/p/pv/pv_1.6.0-1_amd64.deb # or the mirror of your preference https://packages.ubuntu.com/`lsb-release -sc`/amd64/pv/download
dpkg --extract pv*.deb .
mv usr/bin/pv ~/.local/bin
PATH=$PATH:.local/bin
```
##### Source

We do have dev tools, so we can build it locally.

```shell
wget http://www.ivarch.com/programs/sources/pv-1.6.6.tar.gz
tar -xzvf pv-1.6.6.tar.gz
cd pv-1.6.6
configure --prefix=$HOME
make
make install
```
