# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = [
  { name: 'node1', ipaddr: '192.168.200.10', memory: '256' },
  { name: 'node2',  ipaddr: '192.168.200.11', memory:'256' },
]

Vagrant.configure("2") do |config|
  hosts.each do |host|
    config.vm.define host[:name] do |c|
      c.vm.box = "precise64"
      c.vm.box_url = "http://files.vagrantup.com/precise64.box"
      c.vm.hostname = host[:name]
      c.vm.network :private_network, ip: host[:ipaddr], netmask: '255.255.255.0'
      c.vm.provider :virtualbox do |vb|
        modifyvm_args = ['modifyvm', :id]
        modifyvm_args << "--memory" << host[:memory]
        modifyvm_args << "--name" << host[:name]
        modifyvm_args << "--natdnsproxy1" << "on"
        modifyvm_args << "--natdnshostresolver1" << "on"
        vb.customize(modifyvm_args)
      end
      c.vm.provision :shell, :path => "bootstrap.sh"
      c.cache.enable :apt
    end
  end
end
