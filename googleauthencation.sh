#!/bin/bash
apt-get update
apt-get install libpam-google-authenticator
google-authenticator
echo 'auth required pam_google_authenticator.so' >> /etc/pam.d/sshd
echo 'AuthenticationMethods publickey,keyboard-interactive' >> /etc/ssh/sshd_config
sed -i '52s/@include common-auth/#@include common-auth/' /etc/pam.d/sshd
sed -i '49s/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
sed -i '52s/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd.service
