#!/bin/bash
CUR_DIR=$(pwd)
docker run -d -p 8081:80 --name static -v $CUR_DIR:/share hometask-image
docker exec static cp /share/index.html /var/www/html/