Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/precise64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.hostname = "gozma12"
  config.vm.network "private_network", ip: "192.168.27.12"

  config.vm.provision "shell", path: "provision/core.sh"
  config.vm.provision "shell", path: "provision/lamp.sh"
  config.vm.provision "shell", path: "provision/lapp.sh"

end
