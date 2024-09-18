#!/bin/bash

# Task 1: Create user p1, add to groups g1, g2, g3, and set default group for new files
# Create groups g1, g2, g3 if they don't already exist
groupadd g1 2>/dev/null
groupadd g2 2>/dev/null
groupadd g3 2>/dev/null

# Create user p1 if it doesn't exist, and add to groups g1, g2, g3
id -u p1 &>/dev/null || useradd -m -G g1,g2,g3 p1

# Set the default group for files created by p1 to be g1
usermod -g g1 p1

# Task 2: Create directory /tmp/bg as root, assign ownership to Abhi, and set permissions
# Create the directory /tmp/bg
mkdir -p /tmp/bg

# Set the owner to user "Abhi" (assuming the user already exists)
chown Abhi:Abhi /tmp/bg

# Set permissions: user Abhi can create, delete, and modify files in the directory
chmod 770 /tmp/bg

# Ensure that Abhi has write access to all files inside the directory
# Set the sticky bit to prevent others from deleting Abhi's files in the directory
chmod +t /tmp/bg
