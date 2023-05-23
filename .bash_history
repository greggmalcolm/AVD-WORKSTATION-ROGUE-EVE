sudo vi /etc/hosts
sudo hostname avd-ansible
vi /etc/hostname
sudo vi /etc/hostname
sudo vi /etc/hosts
sudo hostname avd-ansible
sudo reboot
apt-get install ansible-core
sudo apt-get install ansible-core
ansible-galaxy collection install arista.avd
ansible-galaxy collection install git+https://github.com/aristanetworks/ansible-avd.git#/ansible_collections/arista/avd/,devel
sudo apt-get install ansible
export ARISTA_AVD_DIR=$(ansible-galaxy collection list arista.avd --format yaml | head -1 | cut -d: -f1)
pip3 install -r ${ARISTA_AVD_DIR}/arista/avd/requirements.txt
sudo apt install python3-pip
git init
git remote add origin https://github.com/greggmalcolm/DCI-Lab/
git pull 
git pull master
ls
pwd
ls
git pull master
git pull origin/master
git pull remote master
git pull 
git checkout master
git pull master
git pull DCI-Lab
git status
ls
cd playbooks/
ls
cd ..
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
;s
ls
cd playbooks/
ls
export ARISTA_AVD_DIR=$(ansible-galaxy collection list arista.avd --format yaml | head -1 | cut -d: -f1)
export ARISTA_AVD_DIR=$(ansible-galaxy collection list arista.avd | head -1 | cut -d: -f1)
cd ..
cd .ansible/
ls
cd collections/
ls
ansible-galaxy collection list
ansible-galaxy collection install arista.avd
export ARISTA_AVD_DIR=$(ansible-galaxy collection list arista.avd --format yaml | head -1 | cut -d: -f1)
export ARISTA_AVD_DIR=$(ansible-galaxy collection list arista.avd | head -1 | cut -d: -f1)
export ARISTA_AVD_DIR=~/.ansible/collections
cd ../..
ls
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
apt-get install ansible
sudo apt-get install ansible
pip list
pip3 install treelib
pip3 install Jinja2
pip3 install cvprac
pip3 install paramiko
pip3 install jsonschema
pip3 install requests
pip3 install md-toc
pip3 install deepmerge
ls
cd playbooks/
ls
cd ..
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
export ARISTA_AVD_DIR=$(ansible-galaxy collection list arista.avd --format yaml | head -1 | cut -d: -f1)
cd .ansible/
ls
cd collections/
cd ansible_collections/
ls
cd a
cd arista/
export ARISTA_AVD_DIR=$~/.ansible/collections/ansible_collections/arista
echo $PATH
export PATH=~/.ansible/collections/ansible_collections/arista
echo $PATH
cd ../../../..
ls
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:~/.ansible/collections/ansible_collections/arista
ls
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
sudo apt-install ansible
sudo apt-get install ansible
sudo apt-get install ansible-core
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
ansible-vault create VAULT 
ls
more VAULT 
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
rm VAULT 
vi vault
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
cd inventory/
more inventory.yml 
cd group_vars/
ls
cd AS_FABRIC/
ls
more as_fabric.yml 
ls
cd ..
ls
cd gregg/
ls
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
ls
cd inventory/intended/configs/
ls
cd ..
cd playbooks/
ls
cd ..
more vault 
cd inventory/
cd group_vars/
ls
cd AS_FABRIC/
ls
more as_fabric.yml 
ls
cp as_fabric.yml as_fabric.yml.old
pwd
cd ..
pwd
chmod 755
ccd ..
cd ..
ls
chmod 755 gregg
chmod 755 ansible
sudo chmod 755 ansible
cd gregg
ls -la
cd inventory/
ls -la
cd group_vars/
ls -la
cd AS_FABRIC/
ls -la
chmod * 755
chmod 755 as_fabric.yml
cd ../../..
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
cd inventory/intended/configs/
ls
cd ../..
cd group_vars/
cd ../..
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
user add ansible
adduser ansible
su -
whoami
sudo adduser ansible
sudo usermod -aG sudo ansible 
sudo
cd /etc
ls | grep ssh
cd ssh/
ls
more ssh_config
ls
more sshd_config
nano sshd.conf
nano sshd.config
ls
nano sshd_config
sudo nano sshd_config
systemctl sshd restart
systemctl restart sshd
sudo systemctl restart sshd
ansible-playbook playbooks/us_dc-fabric-deploy.yml--tags build
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
cd playbooks/
ls
cd ..
ansible-playbook playbooks/us_dc-ztp-configuration.yml 
ls
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
ls
cd playbooks/
ls
cd ..
ansible-playbook playbooks/us_dc-ztp-configuration.yml 
cd /etc
cd ..
ansible-playbook playbooks/us_dc-ztp-configuration.yml 
pwd
cd home/
cd gregg/
ls
ansible-playbook playbooks/us_dc-ztp-configuration.yml 
systemctl status dhcpd
ls
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags provision
ls
ansible-playbook playbooks/us_dc-fabric-deploy.yml--tags build
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
cd inventory/intended/configs/
ls
more AS-BL1.cfg 
cd ../..
cd ..
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
cd inventory/intended/configs/
ls
more AS-BL1.cfg 
cd ../../..
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
cd inventory/intended/configs/
more AS-BL1.cfg 
cd ../../..
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags build
cd inventory/intended/configs/
more SJ-BL1.cfg 
cd ../../..
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags provision
cd playbooks/
ls
more us_dc-fabric-deploy.yml
cd ..
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags provision -vvv
ansible-galaxy collection list
cd /ansible_collections/arista/cvp/plugins/modules/
cd .ansible/collections/
ls
cd ansible_collections/arista/
cd cvp/
ls
cd plugins/
ls
cd module
cd modules/
ls
more cv_configlet_v3.py 
pip list
sudo pip install cvprac
cd /
cd home/
ls
cd gregg/
ls
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags provision
ls
chmod 755 .ansible/
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags provision
cd passwd ansible
sudo passwd ansible
shudown now
shutdown now
ls
cd inventory/
ls
cd group_vars/
ls
ip addr
cd ..
ansible-playbook playbooks/us_dc-fabric-reset-cvp.yml 
sudo pip install --upgrade cvprac
ansible-playbook playbooks/us_dc-fabric-reset-cvp.yml 
cd playbooks/
ls
more us_dc-fabric-deploy.yml
cd ..
ansible-playbook playbooks/us_dc-fabric-deploy.yml --tags provision
shutdown now
sudo shutdown now
cd /etc/
ls | more
cd 
pwd
cd /etc
ls
cd NetworkManager/
ls
ls | g plan
ls | grep plan
ls | grep net
ls | grep net*
cd ..
ls | grep net*
cd netplan/
ls
vi 00-installer-config.yaml 
sudo vi 00-installer-config.yaml 
sudo netplan apply
shutdown now
sudo shutdown now
ls
ping 4.2.2.2
netstat -rn
ip route
cd /etc/netplan/
ls
sudo vi 00-installer-config.yaml 
sudo netplan apply y
sudo vi 00-installer-config.yaml 
sudo netplan apply y
sudo vi 00-installer-config.yaml 
sudo netplan apply y
sudo vi 00-installer-config.yaml 
sudo netplan apply y
sudo vi 00-installer-config.yaml 
sudo netplan apply y
sudo vi 00-installer-config.yaml 
sudo netplan apply y
sudo vi 00-installer-config.yaml 
sudo netplan apply y
sudo vi 00-installer-config.yaml 
sudo netplan apply y
sudo vi 00-installer-config.yaml 
cp 00-installer-config.yaml 00-installer-config.yaml.old
sudo cp 00-installer-config.yaml 00-installer-config.yaml.old
sudo vi 00-installer-config.yaml 
sudo netplan apply 
sudo vi 00-installer-config.yaml 
sudo netplan apply 
sudo vi 00-installer-config.yaml 
sudo netplan apply 
sudo netplan apply [A
sudo vi 00-installer-config.yaml 
sudo netplan apply [A
sudo vi 00-installer-config.yaml 
sudo netplan apply [A
sudo vi 00-installer-config.yaml 
sudo netplan apply 
sudo vi 00-installer-config.yaml 
sudo netplan apply 
sudo vi 00-installer-config.yaml 
sudo netplan apply 
sudo vi 00-installer-config.yaml 
sudo netplan apply 
sudo vi 00-installer-config.yaml 
sudo netplan apply 
ip route s
ping abc.com
