#!/bin/bash
sudo apt-get update 
sudo apt-get install libpam-google-authenticator

if [goole-authencation -eq 0 ]
then
    echo "installing google authencation"
    exit(0)
else
    echo "google authencation already installed"
    exit(1)
fi
