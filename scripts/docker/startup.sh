#!/bin/bash
set -xe
. /root/.gvm/scripts/gvm

# Wait to connect db
while [ "$(mysql -hdb -uroot -ppassword -e "select 1" >/dev/null 2>&1 ;echo $? )" = "1" ];do
  sleep 1
done

# Initialize DB
if [ "$(mysql -hdb -uroot -ppassword -Dxposts -e "select 1" >/dev/null 2>&1 ;echo $? )" = "1" ]; then
  mysql -hdb -uroot -ppassword -e "create database xposts charset utf8"
  GO111MODULE=on go run cmd/cli/migrate.go -exec up
fi

# Run the apps.
GO111MODULE=on go run main.go