# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"

  config.vm.synced_folder '.', '/vagrant', disabled: true
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.network :private_network, ip: "192.168.111.10"

  config.vm.provision :ansible do |ansible|
    ansible.inventory_path = "logging_test.ini"
    ansible.playbook = "logging_test.yml"
    ansible.extra_vars = { user: "vagrant" }
    ansible.limit = 'all'
    # ansible.verbose = 'vvvv'
  end
end