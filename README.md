# Ansible

A home for all of my Ansible playbooks.

## Prerequisites
### Ansible
The first thing you will need is an ansible installed on your management station (desktop/laptop, probably where you are reading this from). Please see my [host setup](https://docs.calebsargeant.com/en/latest/other/general/host-setup.html) documentation.

### Generate SSH Keys
https://docs.calebsargeant.com/en/latest/computing/linux/general.html#generating-ssh-keys

### Python3 on your server
You will need to install python3 on your server (target machine/device), which is the program Ansible uses when deploying - `sudo apt install python3`

### Modify the vars.yml file
You will find the vars files in the `vars/` folder of this project, which contains all the variables necessary to modify for you to execute the Ansible Playbook. Please note that you will need to create your own vars files to match the missing (personal/private) variables and point to them in the vars section of your playbooks.

### Modify the hosts.yml file
You will find the hosts.yml file in the root of this project. Change `x.x.x.x` to the IP Address of the server you would like to deploy to. The hosts.yml file serves as just an example and, just like your vars files, I recommend you create your own hosts file for this repo.

## Usage
I recommend you `cd` into the root of this project, so that you can just execute `ansible-playbook -i hosts.yml playbook.yml`.

## License
[MIT License](https://github.com/CalebSargeant/ansible/blob/master/LICENSE)
