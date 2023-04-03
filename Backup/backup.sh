#!/bin/bash

rsync -avz [user]@[ip]:/[source] /[destination]
sudo tar -cvzf home.tar.gz /[source]
sudo rm -r /[source]