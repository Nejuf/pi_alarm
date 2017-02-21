#!/bin/bash

# setup_pi.sh

sudo apt-get install -y screen

sudo apt-get install -y vim vim-gtk

sudo apt-get install -y locate
sudo updatedb

./install_vnc.sh




echo "$0 Done"

