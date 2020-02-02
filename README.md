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
    
## Migrate

    $ bash scripts/dev.sh migrate (up|down|version)