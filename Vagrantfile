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
echo "192.168.100.120   puppet puppet.minsk.epam.com" >> /etc/hosts
#echo "192.168.100.121   node1 node1.minsk.epam.com" >> /etc/hosts
#rpm -ihv https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
#yum install -y puppetserver
SHELL
  end
  config.vm.define "pnode1", primary: true do |web|
    web.vm.box = "centos/7"
    web.vm.hostname = "puppetstandalone"
    web.vm.network "private_network", ip: "192.168.100.121"
    web.vm.provider "virtualbox" do |host|
        host.name="puppetstandalone"
        host.cpus = 1
        host.memory = 1024
        end
    web.vm.provision "shell", inline: <<-SHELL
echo "192.168.100.120  puppetserver puppet.minsk.epam.com" >> /etc/hosts
echo "192.168.100.121  node1 node1.minsk.epam.com" >> /etc/hosts
#rpm -ihv https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
#yum install -y puppet
SHELL
  end

config.vm.provision "shell", inline: <<-SHELL
echo "This host is ready for provisioning" 
SHELL
end
