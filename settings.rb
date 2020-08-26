# IF YOU CHANGE ANYTHING IN THIS FILE AFTER SETTING UP YOUR VAGRANT MACHINE, YOU HAVE TO RUN "vagrant provision" TO APPLY YOUR MODIFICATIONS!
#
# Red Hat Subscription Management
RHSM_ORG="123456789"               # Organization ID
RHSM_ACTIVATION_KEY="activationkey"  # action key name

# Ansible Vault. Please choose a password here to enable sensitive data encryption when running Ansible
ANSIBLE_VAULT_PASSWORD="aP@ssW0rdf0r8nsib1e"

# Path to your SSH private key on your laptop for git access
SSH_PRIVATE_KEY_PATH="~/.ssh/id_rsa"

# Prepare the git workspace with the next parameters below. Put to no, if you don't want to prepare the workspace or if git repo has not been initialized remotely yet.
PREPARE_GIT_WORKSPACE="no"

# Git URL. Must use SSH URL format.
GIT_URL_WORKSPACE="git@github.com:account/a-repository"
# Git user name.
GIT_USER_NAME="User Name"
# Git user email
GIT_USER_EMAIL="user@domain.com"

