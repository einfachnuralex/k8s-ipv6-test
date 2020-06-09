# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  (1..3).each do |i|
    config.vm.define "k8s#{i}" do |s|
      s.ssh.forward_agent = true
      s.vm.box = "ubuntu/bionic64"
      s.vm.hostname = "k8s#{i}"
      s.vm.network "public_network", ip: "192.168.2.7#{i}", netmask: "255.255.255.0"
      s.vm.provision :shell, path: "scripts/bootstrap.sh"

      s.vm.provider "virtualbox" do |v|
        v.name = "k8s#{i}"
        v.memory = 2048
        v.gui = false
      end
    end      

  end
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end

