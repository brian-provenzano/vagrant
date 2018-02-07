#!/usr/bin/env bash

#get the machine to latest (as of runtime)
apt-get update
apt-get upgrade -y

#finally lets change the pwd for ubuntu user on vagrant since it is unknown in the offical box
echo ubuntu:ubuntu | /usr/sbin/chpasswd
