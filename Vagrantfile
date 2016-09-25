Vagrant.configure("2") do |config|
  config.vm.define "pmaster", primary: true do |web|
    web.vm.box = "centos/7"
    web.vm.hostname = "puppet"
    web.vm.network "private_network", ip: "192.168.100.120"
    web.vm.provider "virtualbox" do |host|
	host.name="puppet"
	host.cpus = 2
	host.memory = 3072
	end
    web.vm.provision "shell", inline: <<-SHELL
echo "Host is ready!!"
SHELL
  end
  config.vm.define "pnode1", primary: true do |web|
    web.vm.box = "centos/7"
    web.vm.hostname = "node1"
    web.vm.network "private_network", ip: "192.168.100.121"
    web.vm.provider "virtualbox" do |host|
        host.name="node1"
        host.cpus = 1
        host.memory = 1024
        end
    web.vm.provision "shell", inline: <<-SHELL
ehco "Host is ready!!"
SHELL
  end

config.vm.provision "shell", inline: <<-SHELL
echo "Provisioning hosts is ready for provisioning"
echo "192.168.100.120   puppet puppet.minsk.epam.com" >> /etc/hosts
echo "192.168.100.121   node1 node1.minsk.epam.com" >> /etc/hosts
yum install -y vim epel-release git
yum install -y puppet
git clone git@github.com:alekskar/puppet.git
puppet apply puppet/tests/init.pp --modulepath=/root
SHELL
end
