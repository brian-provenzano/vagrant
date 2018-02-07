#!/usr/bin/env bash

#get the machine to latest (as of runtime)
#su -c 'yum clean all'
su -c 'yum update -y'
su -c 'yum install -y epel-release'
su -c 'yum install -y python34'
su -c 'yum install -y python34-setuptools'  # install easy_install-3.4
su -c 'easy_install-3.4 pip'

#set jenkins to boot start - move to ansible 
#su -c 'systemctl enable jenkins'

#finally lets change the pwd for ubuntu user on vagrant since it is unknown in the offical box
#echo ubuntu:ubuntu | /usr/sbin/chpasswd

#this is centos - change if needed here
#lazy - change the centos to match the  ubuntu users on all the other boxes in the cluster
su -c 'usermod -l ubuntu -m -d /home/ubuntu vagrant'
su -c 'echo ubuntu:ubuntu | /usr/sbin/chpasswd'