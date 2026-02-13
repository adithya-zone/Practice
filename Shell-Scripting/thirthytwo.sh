#!/bin/bash

USERNAME="adithya"
PASSWORD="sunny@509"
SSHD_CONFIG="/etc/ssh/sshd_config"

if ! id "$USERNAME" &>/dev/null; then
    useradd "$USERNAME"
    echo "User $USERNAME created succesfully"
else
    echo "user $USERNAME is already exists"
fi

echo "$USERNAME:$PASSWORD" | chpasswd
chage -d 0 "$USERNAME"
echo "User $USERNAME created with password reset at first login"

usermod -aG wheel "$USERNAME"
echo "user $USERNAME added to sudo group"

sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' "$SSHD_CONFIG"

systemctl restart sshd
echo "SSHD restarted, password login should works now"