#!/bin/bash

rsync -avz toto@192.168.56.103:/rom /backup
sudo tar -cvzf home.tar.gz /rom
sudo rm -r home