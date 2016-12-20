Vagrant.configure("2") do |config|
    config.ssh.forward_agent = true
    config.ssh.insert_key = false

    # Ubuntu 12.02 - Precise Pangolin
    config.vm.define "ubuntu12" do |ubuntu12|
        ubuntu12.vm.box = "geerlingguy/ubuntu1204"
        ubuntu12.vm.hostname = "gozma12"
        ubuntu12.vm.network "private_network", ip: "192.168.27.12"
        ubuntu12.vm.provision "ansible" do |ansible|
            ansible.playbook = "playbook.yml"
        end
    end
end