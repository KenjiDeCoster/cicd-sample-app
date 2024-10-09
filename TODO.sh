#!/bin/bash
set -euo pipefail

if [ "$(docker ps -a --filter 'name=todo' -q)" ]; then
    docker stop todo
    docker rm todo
fi


cd getting-started-master/app

docker build -t getting-started .
docker run -dp 3000:3000 --name todo getting-started
