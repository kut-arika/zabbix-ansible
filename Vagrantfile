# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos6.5"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box" 

  config.vm.define "zabbix-server" do |zabbix_server|
    zabbix_server.vm.network "private_network", ip: "192.168.34.10"
  end

  config.vm.define "zabbix-agent" do |zabbix_agent|
    zabbix_agent.vm.network "private_network", ip: "192.168.34.11"
  end

end
