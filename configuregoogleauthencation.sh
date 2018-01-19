# RUN THIS COMMAND 
google-authenticator 
#RUN THIS SCRIPT NOW
sudo echo $google_authenticator >> provided.txt
sudo echo 'auth required pam_google_authenticator.so' >> /etc/pam.d/sshd
sudo echo 'AuthenticationMethods publickey,keyboard-interactive' >> /etc/ssh/sshd_config
sudo sed -i '52s/@include common-auth/#@include common-auth/' /etc/pam.d/sshd
sudo sed -i '49s/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i '52s/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd.service
