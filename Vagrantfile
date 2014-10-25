Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/precise64"
  config.vm.hostname = "gozma12"

  config.vm.network "private_network", ip: "192.168.27.12"

  config.vm.provision "shell", path: "provision/core.sh"

end
