#!/bin/bash

# Automation Assignment: Install and configure Ansible and execute a basic playbook

# Step 1: Install Ansible (Ubuntu)
echo "Installing Ansible..."
sudo apt update
sudo apt install -y ansible

# Step 2: Create inventory file
echo "Creating Ansible inventory..."
mkdir -p ~/ansible-setup
cd ~/ansible-setup

cat <<EOF > inventory
[local]
localhost ansible_connection=local
EOF

# Step 3: Write a basic playbook
echo "Writing Ansible playbook..."
cat <<EOF > basic-playbook.yml
- name: Basic Configuration with Ansible
  hosts: local
  tasks:
    - name: Install Apache2
      become: yes
      apt:
        name: apache2
        state: present

    - name: Start Apache2 service
      become: yes
      service:
        name: apache2
        state: started
        enabled: true
EOF

# Step 4: Run the playbook
echo "Running Ansible playbook..."
ansible-playbook -i inventory basic-playbook.yml

echo "Ansible playbook executed. Apache2 should be installed and running on localhost."
