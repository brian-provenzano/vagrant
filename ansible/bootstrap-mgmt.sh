#!/usr/bin/env bash

apt-get update
apt-get upgrade -y

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# copy examples into /home/vagrant (from inside the mgmt node)
# BJP - xenial uses ubuntu as the user not vagrant for the box ubuntu/xenial64
cp -a /vagrant/examples/* /home/ubuntu
chown -R ubuntu:ubuntu /home/ubuntu

#add ssh pipelining to ansible config to speed up connections
cat >> /etc/ansible/ansible.cfg <<EOL

#bump forks up a bit
[defaults]
forks = 25

[ssh_connection]
pipelining = True
EOL

#configure ansible inventory/hosts file like we want it
cat >> /etc/ansible/hosts <<EOL

#localhost ansible_connection=local
[all:vars]
ansible_python_interpreter=/usr/bin/python3

[loadbalance]
lb  

[web]
web1   
web2   
web3   
web4   
web5   
web6   

#[ciserver]
#jenkins   
EOL

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10  mgmt
10.0.15.11  lb
10.0.15.12  jenkins
10.0.15.21  web1
10.0.15.22  web2
10.0.15.23  web3
10.0.15.24  web4
10.0.15.25  web5
10.0.15.26  web6
10.0.15.27  web7
10.0.15.28  web8
10.0.15.29  web9
EOL

#finally lets change the pwd for ubuntu user on vagrant since it is unknown in the offical box
echo ubuntu:ubuntu | /usr/sbin/chpasswd

#create the keypair we are using for the ssh ansible trust
su -c "yes \"\" | ssh-keygen -t rsa -N \"\" -b 2048" ubuntu
