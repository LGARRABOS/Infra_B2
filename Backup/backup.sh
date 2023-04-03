#!/bin/bash

rsync -avz [user]@[ip]:/[source] /[destination]
sudo tar -cvzf backup.tar.gz /[destination]/[source]
sudo rm -r /[destination]/[source]