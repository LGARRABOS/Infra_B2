#!/bin/bash

file_date=$(date +"%y%m%d_%H%M%S")

rsync -avz [user]@[ip]:/[source] /[destination]
tar -cvzf backup/"${file_date}".tar.gz /[destination]/[source]
rm -r /[destination]/[source]