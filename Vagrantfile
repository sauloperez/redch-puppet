# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--name", "mq", "--memory", "512"]
  end
  config.vm.box = "precise32_ruby200"
  config.vm.host_name = "mq"
  config.vm.network :private_network, ip: "33.33.13.37"
  config.vm.synced_folder "/Users/Pau/Sites/pfc-sources/redch-puppet-vm", "/etc/puppet"
end
