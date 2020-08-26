# vagrant-rhel8-ansible
A Vagrant RHEL8 machine with ansible package + some basic utilities

The goal is to create a clean environnement for Ansible playbooks development.

## Vagrant machine content
* Latest Ansible.
* Latest Git.

## Prerequisites
* A Red Hat valid subscription for RHEL8. You have to generate an activation key on your [Red Hat Subscription Management portal](https://access.redhat.com/management)
* A SSH-key pair. Public key must be set on your Git based solution account (GitLab, GitHub, etc).

## Installation
1.  Clone this repository on your laptop.
2.  Fill the variables in [settings.rb](settings.rb). All variables are examples here. You have to set the correct values.
    ```
     # Red Hat Subscription Management
     RHSM_ORG="12345678"               # Organization ID.
     RHSM_ACTIVATION_KEY="my-key"      # action key name
     
     # Ansible Vault. Please choose a password here to enable sensitive data encryption when running Ansible
     ANSIBLE_VAULT_PASSWORD="aP@ssW0rdf0r8nsib1e"

     # Path to your SSH private key on your laptop for GitLab access
     SSH_PRIVATE_KEY_PATH="~/.ssh/id_rsa"
    ```
    Review the complete file before continuing.
3.  Run vagrant
    ```
    vagrant up
    ```
4.  Once the VM is up you can open a SSH connection
    ```
    vagrant ssh
    ```
    You are logged now as *vagrant* user with ansible and git installed.
    
