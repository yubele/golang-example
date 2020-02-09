#!/bin/bash
set -e
current_path=$(readlink -f $(dirname $BASH_SOURCE)/../)
. $current_path/.env
docker_compose="docker-compose -f $current_path/deployments/docker-compose.yml"
case $1 in
  "up") ;&
  "down")
    $docker_compose $@
    ;;
  "exec")
    $docker_compose exec web bash scripts/docker/cmd.sh ${@:2:($#-1)}
    ;;
  "mysql")
    case $2 in
      "-e")
        $docker_compose exec db mysql -u$DBUSER -p$DBPASSWD -D$DBNAME -e "${@:3:($#-2)}"
        ;;
      *)
        $docker_compose exec db mysql -u$DBUSER -p$DBPASSWD -D$DBNAME
      ;;
      esac
    ;;
  "migrate")
    case $2 in
      "up") ;&
      "down") ;&
      "version")
        $docker_compose exec web bash scripts/docker/cmd.sh go run cmd/cli/migrate.go -exec $2
      ;;
      *)
      echo "[MUST BE PARAM up or down]"
      echo "bash scripts/dev.sh migrate (up|down)"
      exit 1
      ;;
    esac
    ;;
  "test")
    if [ -z "$2" ];then
      echo "--- Test Coverage ---"
      $docker_compose exec web bash scripts/docker/cmd.sh go test -vet=off -cover ./... | { grep -v 'no test files'; true; }
      echo "--- All Files Test ---"
      $docker_compose exec web bash scripts/docker/cmd.sh go test -vet=off ./... | { grep -v 'no test files'; true; }
    else
      $docker_compose exec web bash scripts/docker/cmd.sh go test "${@:2:($#-1)}"
    fi
    ;;
  *)
    echo "[Error] missing arg. Must be read README.md."
    exit 1
esac