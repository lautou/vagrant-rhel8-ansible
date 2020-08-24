# -*- mode: ruby -*-
# vi: set ft=ruby :
require_relative "settings"

subscription_script = <<-SCRIPT
subscription-manager unregister 2>/dev/null
subscription-manager register --org=#{RHSM_ORG} --activationkey=#{RHSM_ACTIVATION_KEY}
subscription-manager attach
SCRIPT

packages_installation_script = <<-SCRIPT
dnf -y install ansible git
SCRIPT

install_ansible_vault_password_file_script = <<-SCRIPT 
echo pwd=$PWD
echo #{ANSIBLE_VAULT_PASSWORD} > .vault
chmod 400 .vault
SCRIPT

install_ansible_vault_password_file_script = <<-SCRIPT 
cd
rm -f .vault
echo #{ANSIBLE_VAULT_PASSWORD} > .vault
chmod 400 .vault
SCRIPT

configure_ssh_script = <<-SCRIPT
cat > .ssh/config <<EOF
Host *
    StrictHostKeyChecking no
EOF
chmod 400 .ssh/config
SCRIPT

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "generic/rhel8"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  config.vm.provision "register_rh_subscription", type: "shell", inline: subscription_script
  config.vm.provision "packages_installation", type: "shell", inline: packages_installation_script
  config.vm.provision "install_ansible_vault_password_file", type: "shell", inline: install_ansible_vault_password_file_script, privileged: false
  config.vm.provision "install_git_ssh_private_key", type: "file", source: "#{SSH_PRIVATE_KEY_PATH}", destination: ".ssh/"
  config.vm.provision "configure_ssh", type: "shell", inline: configure_ssh_script, privileged: false
end
