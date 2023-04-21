#!/bin/bash

sudo apt-get install -y sudo software-properties-common curl git build-essential;
sudo apt-add-repository -y ppa:ansible/ansible;
sudo apt-get update;
sudo apt-get install -y curl git ansible build-essential;
sudo apt-get clean autoclean;
sudo apt-get autoremove --yes;
