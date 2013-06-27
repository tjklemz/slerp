# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "skylakes-server"
  config.ssh.username = "ubuntu"
  config.berkshelf.enabled = true
  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.provision :chef_solo do |chef|
    chef.roles_path = "roles"
    chef.add_role "base"
  end
end

