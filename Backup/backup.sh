#!/bin/bash

rsync -avz toto@192.168.56.103:/home /backup
sudo tar -cvzf home.tar.gz /home
sudo rm -r home