#!/bin/bash

file_date=$(date +"%y%m%d_%H%M%S")

rsync -avz [user]@[ip]:/[source] /[home_user_backup]
tar -cvzf /[home_user_backup]/"${file_date}".tar.gz /[home_user_backup]/[source]
rm -r /[home_user_backup]/[source]