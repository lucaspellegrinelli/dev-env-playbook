# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # Configure the box to use
    config.vm.box = "ubuntu/jammy64"
  
    # Configure the resources for the virtual machine
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 2
    end
  
    # Send the vault pass to the VM
    config.vm.provision "file", source: "./vault-pass.txt", destination: "/home/vagrant/vault-pass.txt"
  
    # Use a provisioning script to perform the actions you want
    config.vm.provision "shell", privileged: false, inline: <<-SHELL
      # Update and upgrade the system
      sudo apt-get update && apt-get upgrade -y
  
      # Install necessary packages
      sudo apt-get install -y ansible git
  
      # Clone the specified repository
      git clone https://github.com/lucaspellegrinelli/dev-env-playbook.git /home/vagrant/dev-env-playbook
  
      # Run Ansible playbook
      ansible-playbook /home/vagrant/dev-env-playbook/playbook.yml --vault-password-file /home/vagrant/vault-pass.txt
      rm -rf dev-env-playbook vault-pass.txt
      mkdir -p projects
    SHELL
  end
