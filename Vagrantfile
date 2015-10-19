# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
file_to_disk = File.realpath( "." ).to_s + "/.disk.vdi"
DIMENSION = 200

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Setup Virtualbox VM Setting
  config.vm.provider "virtualbox" do |v|
    v.memory = ENV["MEMORY"] || 16 * 1024
    v.cpus = 4

    if ARGV[0] == "up" && ! File.exist?(file_to_disk)
      v.customize ['createhd', '--filename', file_to_disk, '--size', DIMENSION * 1024]
    end
    v.customize ['storageattach', :id, '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
  end

  unless File.exist?(file_to_disk)
    config.vm.provision "shell", path: "provisions/create_disk.sh"
  end

  config.vm.provision "shell", path: "provisions/mount_disk.sh"
  config.ssh.forward_x11 = true

  # Synced folders
  ## Mount sources directory in shared/ home directory
  config.vm.synced_folder "shared", "/home/vagrant/shared"
  ## Mount provisions in the /provisions directory
  config.vm.synced_folder "provisions", "/provisions"

  # Provisions
  ## Update Distro
  config.vm.provision "shell", path: "provisions/update.sh"
  ## Prepare android build environment
  config.vm.provision "shell", path: "provisions/android.sh"
  ## Prepare extras
  config.vm.provision "shell", path: "provisions/extras.sh"
end
