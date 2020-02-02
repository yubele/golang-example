#!/bin/bash
current_path=$(readlink -f $(dirname $BASH_SOURCE)/../)
. $current_path/.env
docker_compose="docker-compose -f $current_path/deployments/docker-compose.yml"
case $1 in
  "up") ;&
  "down")
    $docker_compose $1
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
  *)
    echo "[Error] missing arg. Must be read README.md."
    exit 1
esac