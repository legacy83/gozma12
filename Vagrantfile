Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/precise64"
  config.vm.box_url = "http://bit.ly/1G6sRtC"

  config.vm.hostname = "gozma12"
  config.vm.network "private_network", ip: "192.168.27.12"

  #config.ssh.insert_key = false
  #config.vm.synced_folder "..", "/vagrant"

  #config.vm.provider "virtualbox" do |v|
  #  v.memory = 1024
  #  v.gui = true
  #end

  ###############################################################
  # gozma12
  ###############################################################

  config.vm.provision "shell", path: "cli/core.sh"
  config.vm.provision "shell", path: "cli/lamp.sh"
  config.vm.provision "shell", path: "cli/lapp.sh"

end