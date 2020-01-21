#!/bin/bash

cut -d_ -f2 sha256sum.txt | while read -r version
do
    docker build \
        --build-arg TERRAFORM_VERSION="$version" \
        --build-arg TERRAFORM_SHA256SUM="$(grep -F "terraform_${version}_" sha256sum.txt | cut -d' ' -f1)" \
        --tag "shogo82148/terraform-tfnotify:$version" .
done
