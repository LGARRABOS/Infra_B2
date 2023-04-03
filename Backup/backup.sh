#!/bin/bash

file_date=$(date +"%y%m%d_%H%M%S")

rsync -avz [user]@[ip]:/[source] /[destination]
sudo tar -cvzf backup/"${file_date}".tar.gz /[destination]/[source]
sudo rm -r /[destination]/[source]