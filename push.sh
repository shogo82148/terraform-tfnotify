#!/bin/bash

docker login -u shogo82148 -p "$DOCKERHUB_PASSWORD"

cut -d_ -f2 sha256sum.txt | while read -r version
do
    docker push "shogo82148/terraform-tfnotify:$version"
done

docker logout
