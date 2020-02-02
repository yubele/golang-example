#!/bin/bash
set -xe

# Wait to connect db
while [ "$(mysql -hdb -uroot -ppassword -e "select 1" >/dev/null 2>&1 ;echo $? )" = "1" ];do
  sleep 1
done

# Initialize DB
if [ "$(mysql -hdb -uroot -ppassword -Dxposts -e "select 1" >/dev/null 2>&1 ;echo $? )" = "1" ]; then
  mysql -hdb -uroot -ppassword -e "create database xposts charset utf8"
  mysql -hdb -uroot -ppassword -Dxposts < admin.sql
fi

# Run the apps.
. /root/.gvm/scripts/gvm
GO111MODULE=on go run main.go