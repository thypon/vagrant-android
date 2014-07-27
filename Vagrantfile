# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"

  # Setup Virtualbox VM Setting
  config.vm.provider "virtualbox" do |v|
    v.memory = 16 * 1024
    v.cpus = 4
  end

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
