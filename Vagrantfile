# -*- mode: ruby -*-
# vi: set ft=ruby

Vagrant.configure("2") do |config|
  config.vm.provision :shell, :path => "bootstrap.sh"

  config.berkshelf.enabled = true
  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root"

  config.vm.provision :chef_solo do |chef|
    chef.roles_path = "roles"
    chef.add_role "base"
  end
      
  config.vm.define :dev do |dev|
    dev.vm.box = "opscode-ubuntu-12.04-chef11"
    dev.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.2.0.box"

    dev.vm.network :forwarded_port, guest: 80, host: 8080
    dev.vm.network :private_network, ip: "192.168.33.10"
  end

  config.vm.define :prod do |prod|
    prod.vm.box = "dummy"
    prod.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    prod.vm.provider :aws do |aws, override|
      override.ssh.private_key_path = "~/.ssh/aws/vagrant.pem"
      override.ssh.username = "ubuntu"

      aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
      aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      aws.keypair_name = "vagrant"

      aws.instance_type = "t1.micro"
      aws.ami = "ami-23d9a94a"
      aws.tags = {
          'Name' => 'Vagrant Test',
      }
    end
  end
end

