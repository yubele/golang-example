# xposts.xyz

# Start the development

## Up docker-compose

    $ bash scripts/dev.sh up
    
## Down docker-compose

    $ bash scripts/dev.sh down
    
## Exec a command on docker

    $ bash scripts/dev.sh exec {command}
    
## Mysql cli

    $ bash scripts/dev.sh mysql

or

    $ bash scripts/dev.sh mysql -e "show tables"
    
## Redis cli

    $ bash scripts/dev.sh redis-cli

## Migrate

    $ bash scripts/dev.sh migrate (up|down|version)
    
## Other Command

    $ bash scripts/dev.sh exec worker bash

## Test

    $ bash scripts/dev.sh test 

or 

    $ bash scripts/dev.sh test ./cmd/cli
    
or

    $ bash scripts/dev.sh test ./cmd/cli/migrate_test.go