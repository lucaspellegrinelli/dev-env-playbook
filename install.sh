#!/bin/bash

sudo apt-get install -y sudo software-properties-common git curl build-essential;
sudo apt-add-repository -y ppa:ansible/ansible;
sudo apt-get update;
sudo apt-get install -y ansible;
sudo apt-get clean autoclean;
sudo apt-get autoremove --yes;
