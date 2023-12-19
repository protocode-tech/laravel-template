#!/bin/bash

set -e

docker-compose run --rm -u $(id -u):$(id -g) -it app composer install
docker-compose exec -u $(id -u):$(id -g) app php artisan key:generate
