# ansible-docker-firefly-iii

The goal for this project is make it as easy and convenient as possible to deploy a Dockerised instance of firefly-iii using Ansible.

## Requirements
* [Hosted DNS with Cloudflare](https://www.cloudflare.com/dns/). It's fast and free.
* [Ubuntu 18.04.3 LTS (Bionic Beaver)](http://releases.ubuntu.com/18.04/) (I have only tested on this Linux distro).
* TCP 443 Port forwarding on your router (unless you choose a custom port). Only if you want to access your instance publicly, asuming you are using a home-server.

## Prerequisites
### Ansible
The first thing you will need is an ansible installed on your management station (desktop/laptop, probably where you are reading this from). Please scroll down to your OS.

**Debian/Ubuntu:**
```
# Install Ansible through Aptitude
sudo apt install ansible -y
```

**MacOS:**
```
brew install python3
pip3 install ansible
```

**Windows:**
```
# Run Powershell as Administrator, run command, reboot
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# Go to Windows Store, search for Linux, install Ubuntu 18.04 LTS & run it

# Update & Upgrade
sudo apt update -y && sudo apt upgrade -y

# See Debian/Ubuntu section above
```
Note: if you downloaded/pulled this repo and want to navigate to it, you can `cd /mnt/x`, where *x* is the drive letter this repo lives.

### SSH Key
You will need to generate a private/public key pair on your management station and copy the public key to the server, so that you can SSH into it without the need for a password. Refer to [this DigitalOcean post](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2) if the below makes no sense.
```
# Generate the key pair
ssh-keygen -t rsa -b 4096

# Copy the public key to your server (where x.x.x.x is the IP Address of your server and user is the name of your user)
ssh-copy-id user@x.x.x.x
```

### Python3 on your server
You will need to install python3 on your server, which is the program Ansible uses when deploying - `sudo apt install python3`

### Modify the vars.yml file
You will find the vars.yml file in the root of this project, which contains all the variables necessary to modify for you to execute the Ansible Playbook.

### Modify the hosts.yml file
You will find the hosts.yml file in the root of this project. Change `x.x.x.x` to the IP Address of the server you would like to deploy ansible to.

## Usage
I recommend you `cd` into the root of this project, so that you can just execute `ansible-playbook -i hosts.yml playbook.yml`.

## Pipeline / Roadmap
The below is what I would like to still accomplish with this project:
* Use the latest postgres image
* Create a **simple** bash script to generate playbook.yml, hosts.yml & vars.yml
* letsencrypt/certbot in docker either using an existing image, or create a new one
* Tidy up Nginx config
* Create a playbook to only update docker container config to not request new certs and to not attempt to install docker again
* Split the docker-firefly role to make it so nginx-proxy is optional
* Add mailer vars, so emailing will work from within firefly-iii
* Change letsencrypt CSR to native ansible, properly specifying the cert destinations that the cronjob will use

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[GNU General Public License v3.0](https://github.com/TempoChocolate/ansible-docker-firefly-iii/blob/master/LICENSE)
